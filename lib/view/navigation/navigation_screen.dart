import 'package:flutter/services.dart';
import 'package:sanad/view/navigation/account/account_screen.dart';
import 'package:sanad/view/navigation/home/home_screen.dart';
import 'package:sanad/view/navigation/myJobs/my_jobs_screen.dart';
import 'package:sanad/view/navigation/wallet/wallet_screen.dart';
import 'package:sanad/viewModels/controller/navigation/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/icon_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/themes/app_themes.dart';
import '../../viewModels/controller/navigation/notification/notification_view_model.dart';
import '../../viewModels/controller/userPreference/user_preference_view_model.dart';

class NavigationScreen extends StatefulWidget {
  final int initialIndex;
  const NavigationScreen({super.key, this.initialIndex = 0});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final navigationVM = Get.put(NavigationViewModel());
  final userVM = Get.put(UserPreference());
  final notificationVM = Get.put(NotificationViewModel());
  // NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    // userVM.fetchUserDetails();
    navigationVM.currentIndex.value = widget.initialIndex;
    _handleNavigationChange(widget.initialIndex);
    // notificationServices.createNotificationChannel();
    // notificationServices.setupInteractMessage(context);
    // // notificationServices.requestNotificationPermission();
    // notificationServices.forgroundMessage();
    // notificationServices.firebaseInit();
    // notificationServices.isTokenRefresh();
    // notificationServices.getDeviceToken();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // value:
      //     Get.isDarkMode
      //         ? SystemUiOverlayStyle.light
      //         : SystemUiOverlayStyle.dark,
      value: SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
        statusBarBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.dark
                : Brightness.light,
        systemNavigationBarColor: Theme.of(context).extension<AppColors>()?.bg,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          extendBody: true,
          body: Obx(() {
            // if (userVM.userEid.value.isEmpty) {
            //   return Center(child: CircularProgressIndicator());
            // }
            return navigationVM.currentScreen.value ?? SizedBox();
          }),

          bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
              elevation: 3,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    IconAssets.icBnSearch,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  activeIcon: Image.asset(IconAssets.icBnSearchSelected),
                  label: 'find_jobs'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    IconAssets.icBnJob,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  activeIcon: Image.asset(IconAssets.icBnJobSelected),
                  label: 'my_jobs'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    IconAssets.icBnWallet,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  activeIcon: Image.asset(IconAssets.icBnWalletSelected),
                  label: 'wallet'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    IconAssets.icBnAccount,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  activeIcon: Image.asset(IconAssets.icBnAccountSelected),
                  label: 'account'.tr,
                ),
              ],
              currentIndex: navigationVM.currentIndex.value,
              selectedItemColor:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              unselectedItemColor:
                  Theme.of(
                    context,
                  ).bottomNavigationBarTheme.unselectedItemColor,
              selectedIconTheme:
                  Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
              unselectedIconTheme:
                  Theme.of(
                    context,
                  ).bottomNavigationBarTheme.unselectedIconTheme,
              onTap: _handleNavigationChange,
            );
          }),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    navigationVM.currentIndex.value = index;
    switch (index) {
      case 0:
        navigationVM.changeScreen(HomeScreen());
        break;
      case 1:
        navigationVM.changeScreen(MyJobsScreen());
        break;
      case 2:
        navigationVM.changeScreen(WalletScreen());
        break;
      case 3:
        navigationVM.changeScreen(AccountScreen());
        break;
      default:
        navigationVM.changeScreen(HomeScreen());
        break;
    }
  }
}
