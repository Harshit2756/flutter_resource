import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants/sizes.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  final String? message;

  const ShimmerLoadingWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Shimmer effect for the search bar
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: HSizes.sm8, vertical: HSizes.md16),
              width: double.infinity,
              height: HSizes.appBarHeight56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Shimmer effect for the list items
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: HSizes.sm8),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
