import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanad/res/localization/languages.dart';
import 'package:sanad/res/routes/routes.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/viewModels/services/theme_service.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = Get.put(ThemeService());
  await themeService.init();
  SystemChrome.setSystemUIOverlayStyle(
    Get.isDarkMode
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark,
    // const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    //   systemNavigationBarContrastEnforced: false,
    //   systemNavigationBarDividerColor: Colors.transparent,
    // ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    return GetMaterialApp(
      title: 'Sanad',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeService.themeMode,
      initialRoute: RoutesName.splashScreen,
      // initialRoute: RoutesName.navigationScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
