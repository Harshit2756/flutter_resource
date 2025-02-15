import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class FeatureHorizontalCard extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onTap;
  final double height, width;
  final Widget? child;

  const FeatureHorizontalCard({
    this.title,
    this.icon,
    this.onTap,
    super.key,
    this.height = HSizes.cardHeight80,
    this.width = double.infinity,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(HSizes.cardRadiusLg16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(10, 10),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 20,
              offset: Offset(-10, -10),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: HSizes.md16, vertical: HSizes.sm8),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon, size: HSizes.iconLg40),
                const SizedBox(width: HSizes.spaceBtwItems8),
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
      ),
    );
  }
}
