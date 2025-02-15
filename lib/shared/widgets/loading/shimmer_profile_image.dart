import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProfileImage extends StatelessWidget {
  final double size;

  const ShimmerProfileImage({
    super.key,
    this.size = 60.0, // Default size for the profile image
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
