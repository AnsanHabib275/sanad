import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/localization/languages.dart';
import 'package:sanad/res/routes/routes.dart';
import 'package:sanad/res/routes/routes_name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FocusManager.instance.primaryFocus?.unfocus();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarDividerColor: Colors.transparent,
      // systemNavigationBarColor: Theme.of(context).primaryColor,
      //  systemNavigationBarIconBrightness:
      //  Theme.of(context).brightness == Brightness.dark
      //      ? Brightness.light
      //      : Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sanad',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // theme: ThemeData(
      //   primaryColor: AppColor.background,
      //   scaffoldBackgroundColor: AppColor.whiteColor,
      //   colorScheme: ColorScheme.light(
      //     surface: AppColor.whiteColor,
      //     onSurface: AppColor.whiteColor,
      //     primary: AppColor.background,
      //   ),
      //   // colorScheme: ColorScheme.dark(
      //   //   surface: AppColor.blackLight,
      //   //   onSurface: AppColor.whiteColor,
      //   //   primary: AppColor.background,
      //   // ),
      //   useMaterial3: true,
      // ),
      // initialBinding: BindingsBuilder(() {
      //   Get.put(StatusBarService());
      // }),
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.whiteColor,
        colorScheme: ColorScheme.light(
          primary: AppColor.primaryColor,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
