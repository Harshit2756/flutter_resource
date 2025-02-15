// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:image_icons_app/modules/auth/views/Icons/icons_list_view.dart';

// class IconsListViewState extends State<IconsListView> {
//   static const int pageSize = 50;
//   int currentDisplayCount = pageSize;
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ... existing AppBar ...
//       body: Column(
//         children: [
//           // ... existing search TextField ...
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (controller.filteredIcons.isEmpty) {
//                 return const Center(
//                   child: Text('No icons found'),
//                 );
//               }

//               final displayedIcons = controller.filteredIcons.take(currentDisplayCount).toList();

//               return NotificationListener<ScrollNotification>(
//                 onNotification: (ScrollNotification scrollInfo) {
//                   if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
//                     // Load more items when reaching the bottom
//                     setState(() {
//                       currentDisplayCount = (currentDisplayCount + pageSize)
//                           .clamp(0, controller.filteredIcons.length);
//                     });
//                   }
//                   return true;
//                 },
//                 child: GridView.builder(
//                   controller: _scrollController,
//                   padding: const EdgeInsets.all(16.0),
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 100,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemCount: displayedIcons.length + 
//                       (displayedIcons.length < controller.filteredIcons.length ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (index == displayedIcons.length) {
//                       return const Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: CircularProgressIndicator(),
//                         ),
//                       );
//                     }

//                     final item = displayedIcons[index];
//                     final isIconsax = item.key.startsWith('i_');
//                     final clipBoardValue = isIconsax
//                         ? 'Iconsax.${item.key}'
//                         : item.key.startsWith('bootstrap_')
//                             ? 'Bootstrap.${item.key.replaceFirst('bootstrap_', '')}'
//                             : 'AntDesign.${item.key}';

//                     return FeatureCard(
//                       color: selectedColor,
//                       shopBar: false,
//                       title: item.key.replaceAll(RegExp(r'i_|bootstrap_'), ''),
//                       icon: item.value,
//                       onTap: () => _copyToClipboard(context, item, clipBoardValue),
//                     );
//                   },
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//       // ... existing FloatingActionButton ...
//     );
//   }

//   // ... rest of the existing methods ...
// } 