import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/view/selectRole/select_role_screen.dart';
import 'package:sanad/view/signup/individual/sign_up_individual_screen.dart';

import '../../view/OnBoarding/onboarding_screen.dart';
import '../../view/forgetPassword/forget_password_screen.dart';
import '../../view/login/login_screen.dart';
import '../../view/navigation/changePassword/change_password_screen.dart';
import '../../view/navigation/home/home_screen.dart';
import '../../view/navigation/navigation_screen.dart';
import '../../view/navigation/notification/notification_screen.dart';
import '../../view/navigation/profile/profile_screen.dart';
import '../../view/otp/otp_screen.dart';
import '../../view/resetPassword/reset_password_screen.dart';
import '../../view/signup/agency/sign_up_screen.dart';
import '../../view/splash/splash_screen.dart';
import '../../view/verifyEmail/verify_email_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.onBoardingScreen,
      page: () => OnBoardingScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.loginScreen,
      page: () => LoginScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.selectRoleScreen,
      page: () => SelectRoleScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.signUpIndividualScreen,
      page: () => SignUpIndividualScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.signUpScreen,
      page: () => SignUpScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.navigationScreen,
      page: () => NavigationScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.notificationScreen,
      page: () => NotificationScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),

    // GetPage(
    //   name: RoutesName.fakeProductScreen,
    //   // page: () => FakeProductScreen(),
    //   page: () => const DarkStatusBarWrapper(child: FakeProductScreen()),
    //   middlewares: [StatusBarMiddleware(darkStatusBar: true)],
    //   transitionDuration: Duration(milliseconds: 300),
    //   transition: Transition.leftToRightWithFade,
    //   curve: Curves.easeInOut,
    // ),
    GetPage(
      name: RoutesName.profileScreen,
      page: () => ProfileScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.verifyEmailScreen,
      page: () => VerifyEmailScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.changePasswordScreen,
      page: () => ChangePasswordScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),

    GetPage(
      name: RoutesName.otpScreen,
      page: () => OTPScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
  ];
}
