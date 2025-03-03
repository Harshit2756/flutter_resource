import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:device_preview/device_preview.dart';
import 'device_preview_button.dart';

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
  runApp(
    DevicePreview(
      backgroundColor: Colors.black87,
      tools: const [
        CustomPlugin(
          apkDownloadUrl: "https://github.com/Harshit2756/flutter_resource/releases/download/v1.0.1/app-release.apk",
          sourceCodeUrl: "https://github.com/Harshit2756/flutter_resource/archive/refs/tags/v1.0.1.zip",
        ),
        DeviceSection(frameVisibility: true, orientation: false, virtualKeyboard: true, model: true),
        SettingsSection(backgroundTheme: false, toolsTheme: true),
        // SystemSection(locale: false, theme: false),
        DevicePreviewScreenshot(),
      ],
      devices: [
        Devices.android.samsungGalaxyA50,
        Devices.android.samsungGalaxyNote20,
        Devices.android.samsungGalaxyS20,
        Devices.android.samsungGalaxyNote20Ultra,
        Devices.android.onePlus8Pro,
        Devices.android.sonyXperia1II,
        Devices.ios.iPhoneSE,
        Devices.ios.iPhone12,
        Devices.ios.iPhone12Mini,
        Devices.ios.iPhone12ProMax,
        Devices.ios.iPhone13,
        Devices.ios.iPhone13ProMax,
        Devices.ios.iPhone13Mini,
        Devices.ios.iPhoneSE,
      ],
      enabled: true,
      builder: (context) => const App(),
    ),
  );
}
class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Image Icons App',
      theme: HAppTheme.lightTheme,
      home: const SplashView(),
      defaultTransition: Transition.fadeIn,
    );
  }
}

