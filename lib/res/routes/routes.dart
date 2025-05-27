import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/view/navigation/about/about_screen.dart';
import 'package:sanad/view/navigation/account/account_screen.dart';
import 'package:sanad/view/navigation/analytics/analytics_screen.dart';
import 'package:sanad/view/navigation/applyJob/additionalRequirementJob/additional_requirements_job_screen.dart';
import 'package:sanad/view/navigation/applyJob/generalJob/apply_job_screen.dart';
import 'package:sanad/view/navigation/help/help_screen.dart';
import 'package:sanad/view/navigation/myJobs/my_jobs_screen.dart';
import 'package:sanad/view/navigation/payment/payment_screen.dart';
import 'package:sanad/view/navigation/profile/edit_profile_screen.dart';
import 'package:sanad/view/navigation/rateUs/rate_us_screen.dart';
import 'package:sanad/view/navigation/submittedCV/submitted_cv_screen.dart';
import 'package:sanad/view/navigation/transactions/transactions_screen.dart';
import 'package:sanad/view/navigation/viewJob/view_job_screen.dart';
import 'package:sanad/view/navigation/viewJobDetail/view_job_detail_screen.dart';
import 'package:sanad/view/navigation/wallet/wallet_screen.dart';
import 'package:sanad/view/selectRole/select_role_screen.dart';
import 'package:sanad/view/signup/individual/sign_up_individual_screen.dart';

import '../../view/OnBoarding/onboarding_screen.dart';
import '../../view/forgetPassword/forget_password_screen.dart';
import '../../view/login/login_screen.dart';
import '../../view/navigation/applyJob/reviewJob/review_job_screen.dart';
import '../../view/navigation/changePassword/change_password_screen.dart';
import '../../view/navigation/home/home_screen.dart';
import '../../view/navigation/navigation_screen.dart';
import '../../view/navigation/notification/notification_screen.dart';
import '../../view/navigation/payment/payment_detail_screen.dart';
import '../../view/navigation/profile/profile_screen.dart';
import '../../view/otp/otp_screen.dart';
import '../../view/resetPassword/reset_done_screen.dart';
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
      name: RoutesName.myJobsScreen,
      page: () => MyJobsScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.accountScreen,
      page: () => AccountScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.walletScreen,
      page: () => WalletScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.paymentsScreen,
      page: () => PaymentScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.paymentDetailScreen,
      page: () => PaymentDetailScreen(),
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
      name: RoutesName.resetDoneScreen,
      page: () => ResetDoneScreen(),
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
    GetPage(
      name: RoutesName.rateUsScreen,
      page: () => RateUsScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.aboutScreen,
      page: () => AboutScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.transactionsScreen,
      page: () => TransactionsScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.helpScreen,
      page: () => HelpScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.analyticsScreen,
      page: () => AnalyticsScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.viewJobScreen,
      page: () => ViewJobScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.applyJobScreen,
      page: () => ApplyJobScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.additionalRequirementsJobScreen,
      page: () => AdditionalRequirementsJobScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.reviewJobScreen,
      page: () => ReviewJobScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.editProfileScreen,
      page: () => EditProfileScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.submittedCvScreen,
      page: () => SubmittedCVScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: RoutesName.viewJobDetailScreen,
      page: () => ViewJobDetailScreen(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.leftToRightWithFade,
      curve: Curves.easeInOut,
    ),
  ];
}
