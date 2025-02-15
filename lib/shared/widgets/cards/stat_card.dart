import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const StatCard({
    required this.title,
    required this.value,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(HSizes.cardRadiusLg16),
        color: HColors.white,
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: HSizes.md16, vertical: HSizes.sm8),
      margin: const EdgeInsets.only(bottom: HSizes.sm8, top: HSizes.md16),
      width: HHelperFunctions.screenWidth() * 0.3,
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: HSizes.spaceBtwItems8),
          const Divider(
            color: HColors.white,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: HSizes.spaceBtwItems8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
