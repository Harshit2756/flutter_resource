import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../views/Icons/icons_list.dart';

class IconsController extends GetxController {
  final RxString searchQuery = ''.obs;
  final RxList<MapEntry<String, IconData>> filteredIcons =
      <MapEntry<String, IconData>>[].obs;
  final RxBool isLoading = true.obs;
  Timer? _debounceTimer;

  // Create a map for faster lookups
  final Map<String, List<MapEntry<String, IconData>>> _searchIndex = {};
  List<MapEntry<String, IconData>> allIcons = [];

  void clearSearch() {
    searchQuery.value = '';
    filteredIcons.value = allIcons;
  }

  void loadIcons() {
    isLoading.value = true;

    // Load icons in a separate isolate or compute to prevent UI blocking
    Future.microtask(() {
      allIcons = [
        ...Iconsax.items.entries,
        ...antOutlineIcons.map((item) => MapEntry<String, IconData>(
              item[1] as String,
              item[0] as IconData,
            )),
        ...antFillIcons.map((item) => MapEntry<String, IconData>(
              item[1] as String,
              item[0] as IconData,
            )),
        ...bootstrapIcons.map((item) => MapEntry<String, IconData>(
              item[1] as String,
              item[0] as IconData,
            )),
      ];

      // Build search index
      _buildSearchIndex();

      filteredIcons.value = allIcons;
      isLoading.value = false;
    });
  }

  @override
  void onClose() {
    _debounceTimer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    loadIcons();
  }

  void search(String query) {
    // Cancel previous timer if it exists
    _debounceTimer?.cancel();

    // Set a new timer
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      searchQuery.value = query;
      if (query.isEmpty) {
        filteredIcons.value = allIcons;
        return;
      }

      final lowercaseQuery = query.toLowerCase();

      // Use indexed search for better performance
      final searchResults = _searchIndex[lowercaseQuery];
      if (searchResults != null) {
        // Direct match from index
        filteredIcons.value = searchResults;
      } else {
        // Fallback to contains search
        filteredIcons.value = allIcons.where((item) {
          final name = item.key.toLowerCase();
          return name.contains(lowercaseQuery);
        }).toList();
      }
    });
  }

  void _buildSearchIndex() {
    for (var icon in allIcons) {
      final words = icon.key.toLowerCase().split('_');
      for (var word in words) {
        for (var i = 1; i <= word.length; i++) {
          final prefix = word.substring(0, i);
          _searchIndex.putIfAbsent(prefix, () => []).add(icon);
        }
      }
    }
  }
}
