import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_icons_app/modules/auth/views/dashboard.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/widgets/loading/loading_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [HColors.primary, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () async {
            // await initServices();
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: HColors.primary,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: FlutterLogo(
                          size: 80,
                          style: FlutterLogoStyle.stacked,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Welcome',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: HColors.primary,
                              ),
                    ),
                    const SizedBox(height: 20),
                    const LoadingWidget(),
                  ],
                ),
              );
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Get.offAll(const DashboardView());
              });
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
