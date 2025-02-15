import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../shared/theme/colors.dart';
import '../../../../shared/widgets/cards/feature_card.dart';
import '../../controllers/icons_controller.dart';

class IconsListView extends StatefulWidget {
  const IconsListView({super.key});

  @override
  IconsListViewState createState() => IconsListViewState();
}

class IconsListViewState extends State<IconsListView> {
  final IconsController controller = Get.put(IconsController());
  Color selectedColor = HColors.primary;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Icons'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              controller.clearSearch();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: controller.search,
              decoration: InputDecoration(
                hintText: 'Search icons...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: Obx(() => controller.searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          controller.clearSearch();
                        },
                      )
                    : const SizedBox.shrink()),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.filteredIcons.isEmpty) {
                return const Center(
                  child: Text('No icons found'),
                );
              }

              return GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 115,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.filteredIcons.length,
                itemBuilder: (context, index) {
                  final item = controller.filteredIcons[index];
                  final isIconsax = item.key.startsWith('i_');
                  final clipBoardValue = isIconsax
                      ? 'Iconsax.${item.key}'
                      : 'AntDesign.${item.key}';

                  return FeatureCard(
                    color: selectedColor,
                    shopBar: false,
                    title: item.key.replaceAll('i_', ''),
                    icon: item.value,
                    onTap: () {
                      _copyToClipboard(context, item, clipBoardValue);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _copyToClipboard(BuildContext context, MapEntry<String, IconData> item,
      String clipBoardValue) {
    Clipboard.setData(ClipboardData(text: clipBoardValue));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              item.value,
              size: 34,
              color: selectedColor,
            ),
            const SizedBox(width: 8),
            Text('$clipBoardValue added to ClipBoard'),
          ],
        ),
      ),
    );
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
