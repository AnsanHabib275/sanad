import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';
import '../../../viewModels/controller/registerFirebaseToken/register_firebase_token_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userVM = Get.find<UserPreference>();
  final firebaseTokenVM = Get.put(RegisterFirebaseTokenViewModel());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.splashBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(60)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
