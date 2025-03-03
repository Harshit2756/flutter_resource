import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_icons_app/modules/auth/views/splash_view.dart';

import 'shared/theme/colors.dart';
import 'shared/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: HColors.primary,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Image Icons App',
      theme: HAppTheme.lightTheme,
      home: const SplashView(),
      defaultTransition: Transition.fadeIn,
    );
  }
}
