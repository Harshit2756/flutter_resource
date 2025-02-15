import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../shared/utils/constants/sizes.dart';
import '../../../shared/utils/media/icons_strings.dart';
import '../../../shared/utils/media/text_strings.dart';
import '../../../shared/widgets/appbar/custom_appbar.dart';
import '../../../shared/widgets/cards/feature_card.dart';
import 'Icons/icons_list_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withText(
        bottom: HSizes.appBarHeight100,
        title: HTexts.dashboard,
        leadingWidget: IconButton(
          onPressed: () {},
          icon: const Icon(HIcons.menu),
        ),
        actions: [
          IconButton(
            // close app
            onPressed: () => Get.back(),
            icon: const Icon(HIcons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Main Features Grid
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            childAspectRatio: 1,
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              FeatureCard(
                title: "All Icons",
                icon: Iconsax.activity,
                onTap: () {
                  Get.to(() => const IconsListView());
                },
              ),
              // FeatureCard(
              //   title: "interactive shadow widget",
              //   icon: Iconsax.airdrop,
              //   onTap: () {
              //     Get.to(() => const InteractiveShadowScreen());
              //   },
              // ),
              // FeatureCard(
              //   title: "animated scroll text",
              //   icon: Iconsax.document_text,
              //   onTap: () {
              //     Get.to(() => const PaintDemoApp());
              //   },
              // ),
              // FeatureCard(
              //   title: "particle animation",
              //   icon: Iconsax.document_text,
              //   onTap: () {
              //     Get.to(() => const ParticleAnimationScreen());
              //   },
              // ),
              // FeatureCard(
              //   title: "aura matrix",
              //   icon: Iconsax.document_text,
              //   onTap: () {
              //     Get.to(() => const MatrixEffect());
              //   },
              // ),
              // FeatureCard(
              //   title: "Rive Card",
              //   icon: Iconsax.document_text,
              //   onTap: () {
              //     Get.to(() => const RiveCardAnimation());
              //   },
              // ),
              // FeatureCard(
              //   title: "Cosmos",
              //   icon: Iconsax.document_text,
              //   onTap: () {
              //     Get.to(() => const Cosmos());
              //   },
              // ),
              // FeatureCard(
              //   title: "Particle Animation 2",
              //   icon: Iconsax.document_text,
              //   onTap: () {
              //     Get.to(
              //       () => const AnimatedBackground(
              //         config: AnimatedBackgroundConfig(
              //           numberOfParticles: 150,
              //           minParticleSize: 2,
              //           maxParticleSize: 4,
              //           particleColor: Colors.blue,
              //           backgroundColor: Color(0xFF1a1a1a),
              //           connectionDistance: 150,
              //           enableConnections: true,
              //           particleOrigin: ParticleOrigin.center,
              //           spreadRadius: 300,
              //           particleGlowRadius: 2,
              //           particleBlendMode: BlendMode.screen,
              //           particleGradientColors: [
              //             Colors.blue,
              //             Colors.lightBlueAccent,
              //             Colors.white,
              //           ],
              //           randomizeParticleColors: true,
              //         ),
              //         child: Center(
              //           child: Text(
              //             'Your Content Here',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
