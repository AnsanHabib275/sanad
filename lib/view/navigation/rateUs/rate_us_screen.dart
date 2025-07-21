import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/rateUs/widget/input_message_widget.dart';
import 'package:sanad/view/navigation/rateUs/widget/submit_button_widget.dart';
import 'package:sanad/viewModels/controller/navigation/rateUs/rate_us_view_model.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class RateUsScreen extends StatefulWidget {
  const RateUsScreen({super.key});

  @override
  State<RateUsScreen> createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  final rateUsVM = Get.put(RateUsViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: IconButton(
              icon: Image.asset(
                IconAssets.icArrowLeft,
                height: Utils.getResponsiveHeight(24),
                width: Utils.getResponsiveWidth(24),
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text('rate_us'.tr),
            titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
            shape: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Utils.getResponsiveWidth(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        Utils.getResponsiveSize(12),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Utils.getResponsiveHeight(16)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.getResponsiveWidth(16),
                          ),
                          child: Text(
                            'rate_us_dot'.tr,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize: Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(4)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.getResponsiveWidth(16),
                          ),
                          child: Text(
                            'rate_us_and_write_your_feedback'.tr,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize: Utils.getResponsiveSize(12),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(16)),
                        Divider(
                          color: Theme.of(context).dividerColor,
                          height: Utils.getResponsiveHeight(1),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(16)),
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Utils.getResponsiveWidth(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'your_message'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize: Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: Utils.getResponsiveHeight(12)),
                                InputMessageWidget(),
                                SizedBox(height: Utils.getResponsiveHeight(12)),
                                Text(
                                  'write_your_feedback_and_remarks'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(
                                          context,
                                        ).extension<AppColors>()?.textBodyColor,
                                    fontSize: Utils.getResponsiveSize(12),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(16)),
                        Divider(
                          color: Theme.of(context).dividerColor,
                          height: Utils.getResponsiveHeight(1),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(16)),
                        Align(
                          alignment: Alignment.center,
                          child: RatingBar.builder(
                            initialRating: rateUsVM.rating.value,
                            minRating: 0.0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            updateOnDrag: true,
                            unratedColor: Theme.of(context).iconTheme.color,
                            itemCount: 5,
                            itemSize: Utils.getResponsiveSize(24),
                            itemPadding: EdgeInsets.symmetric(
                              horizontal: Utils.getResponsiveWidth(3),
                            ),
                            itemBuilder: (context, index) {
                              return Image.asset(
                                IconAssets.icRating,
                                color: AppColor.ratedStarColor,
                              );
                            },
                            onRatingUpdate:
                                (rating) => rateUsVM.rating.value = rating,
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(16)),
                      ],
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  SubmitButtonWidget(formKey: formKey),
                  SizedBox(height: Utils.getResponsiveHeight(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
