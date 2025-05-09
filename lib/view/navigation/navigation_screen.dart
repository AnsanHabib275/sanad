import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/navigation/home/home_screen.dart';
import 'package:sanad/viewModels/controller/navigation/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/icon_assets.dart';
import '../../res/colors/app_color.dart';
import '../../viewModels/controller/navigation/notification/notification_view_model.dart';
import '../../viewModels/controller/userPreference/user_preference_view_model.dart';
// import '../../viewModels/services/notification_services.dart';

class NavigationScreen extends StatefulWidget {
  final int initialIndex;
  const NavigationScreen({super.key, this.initialIndex = 2});

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
    userVM.fetchUserDetails();
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        body: Obx(() {
          if (userVM.userEid.value.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return navigationVM.currentScreen.value ?? SizedBox();
        }),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            bottom: Get.height * Utils.getResponsiveHeight(44),
            left: Get.height * Utils.getResponsiveHeight(20),
            right: Get.height * Utils.getResponsiveHeight(20),
          ),
          height: Get.height * Utils.getResponsiveHeight(68),
          decoration: BoxDecoration(
            color: AppColor.bottomNavigation,
            borderRadius: BorderRadius.all(Radius.circular(34)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                0,
                IconAssets.icBnSearch,
                IconAssets.icBnSearchSelected,
              ),
              _buildNavItem(1, IconAssets.icBnJob, IconAssets.icBnJobSelected),
              _buildNavItem(
                2,
                IconAssets.icBnWallet,
                IconAssets.icBnWalletSelected,
              ),
              _buildNavItem(
                3,
                IconAssets.icBnAccount,
                IconAssets.icBnAccountSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String activeIcon) {
    return Obx(() {
      return IconButton(
        onPressed: () => _handleNavigationChange(index),
        icon: Image.asset(
          navigationVM.currentIndex.value == index ? activeIcon : icon,
        ),
      );
    });
  }

  void _handleNavigationChange(int index) {
    navigationVM.currentIndex.value = index;
    switch (index) {
      case 0:
        navigationVM.changeScreen(HomeScreen());
        break;
      case 1:
        navigationVM.changeScreen(HomeScreen());
        break;
      case 2:
        navigationVM.changeScreen(HomeScreen());
        break;
      case 3:
        navigationVM.changeScreen(HomeScreen());
        break;
      default:
        navigationVM.changeScreen(HomeScreen());
        break;
    }
  }
}
