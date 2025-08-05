import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanad/res/localization/languages.dart';
import 'package:sanad/res/routes/routes.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/viewModels/services/theme_service.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeCoreServices();
    runApp(const MyApp());
  } catch (e) {
    runApp(const ErrorApp());
  }
}

Future<void> _initializeCoreServices() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final themeService = Get.put(ThemeService());
  await themeService.init();
  SystemChrome.setSystemUIOverlayStyle(
    Get.isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
  );
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Initialization failed'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => runApp(const MyApp()),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
      theme: AppThemes.lightTheme(context),
      darkTheme: AppThemes.darkTheme(context),
      themeMode: themeService.themeMode,
      initialRoute: RoutesName.splashScreen,
      // initialRoute: RoutesName.navigationScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
