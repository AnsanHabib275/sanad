import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/view/navigation/withdrawFunds/widget/withdraw_button_widget.dart';
import 'package:sanad/view/navigation/withdrawFunds/widget/withdraw_now_button_widget.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class WithdrawFundsScreen extends StatefulWidget {
  const WithdrawFundsScreen({super.key});

  @override
  State<WithdrawFundsScreen> createState() => _WithdrawFundsScreenState();
}

class _WithdrawFundsScreenState extends State<WithdrawFundsScreen> {

  late int selectedMethod = 1;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: IconButton(
            icon: Image.asset(
              IconAssets.icArrowLeft,
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('withdraw_funds'.tr),
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
            horizontal: Get.width * Utils.getResponsiveWidth(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).extension<AppColors>()?.cardBg,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Get.height * Utils.getResponsiveHeight(8)),
                  ),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(16),
                    vertical: Get.height * Utils.getResponsiveHeight(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'total_balance'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                ImageAssets.saudiRiyalSymbol,
                                height:
                                Get.height * Utils.getResponsiveHeight(18),
                                width: Get.width * Utils.getResponsiveWidth(20),
                                color: Theme.of(context).iconTheme.color,
                              ),
                            SizedBox(width: Get.width * Utils.getResponsiveWidth(8),),
                            Text(
                              '100.00',
                              style: TextStyle(
                                color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                Get.height * Utils.getResponsiveSize(20),
                              ),
                            ),
                          ],),
                        ],
                      ),
                      WithdrawNowButtonWidget(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
              Container(
                // height: Get.height * Utils.getResponsiveHeight(162),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).extension<AppColors>()?.cardBg,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      Get.height * Utils.getResponsiveHeight(8),
                    ),
                  ),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(16),
                    vertical: Get.height * Utils.getResponsiveHeight(16),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'set_amount'.tr,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).extension<AppColors>()?.textPrimaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            fontSize:
                            Get.height * Utils.getResponsiveSize(14),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * Utils.getResponsiveHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssets.saudiRiyalSymbol,
                            height:
                            Get.height * Utils.getResponsiveHeight(24),
                            width: Get.width * Utils.getResponsiveWidth(26),
                            color: Theme.of(context).iconTheme.color,
                          ),
                          SizedBox(width: Get.width * Utils.getResponsiveWidth(12),),
                          Text(
                            '20.00',
                            style: TextStyle(
                              color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              fontSize:
                              Get.height * Utils.getResponsiveSize(30),
                            ),
                          ),
                        ],),
                      SizedBox(height: Get.height * Utils.getResponsiveHeight(10),),
                      Divider(
                        height: Get.height * Utils.getResponsiveHeight(1),
                        color: Theme.of(context).dividerColor,
                      ),
                      SizedBox(height: Get.height * Utils.getResponsiveHeight(20),),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.containerBg,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  Get.height * Utils.getResponsiveHeight(6),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width * Utils.getResponsiveWidth(10),
                                vertical: Get.height * Utils.getResponsiveHeight(2),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.saudiRiyalSymbol,
                                    height:
                                    Get.height * Utils.getResponsiveHeight(12),
                                    width: Get.width * Utils.getResponsiveWidth(11),
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  SizedBox(width: Get.width * Utils.getResponsiveWidth(4),),
                                  Text(
                                    '10.00',
                                    style: TextStyle(
                                      color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.textPrimaryColor,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ],),
                            ),
                          ),
                          SizedBox(width: Get.width * Utils.getResponsiveWidth(14)),
                          Container(
                            decoration: BoxDecoration(
                              color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.containerBg,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  Get.height * Utils.getResponsiveHeight(6),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width * Utils.getResponsiveWidth(10),
                                vertical: Get.height * Utils.getResponsiveHeight(2),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.saudiRiyalSymbol,
                                    height:
                                    Get.height * Utils.getResponsiveHeight(12),
                                    width: Get.width * Utils.getResponsiveWidth(11),
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  SizedBox(width: Get.width * Utils.getResponsiveWidth(4),),
                                  Text(
                                    '20.00',
                                    style: TextStyle(
                                      color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.textPrimaryColor,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ],),
                            ),
                          ),
                          SizedBox(width: Get.width * Utils.getResponsiveWidth(14)),
                          Container(
                            decoration: BoxDecoration(
                              color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.containerBg,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  Get.height * Utils.getResponsiveHeight(6),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width * Utils.getResponsiveWidth(10),
                                vertical: Get.height * Utils.getResponsiveHeight(2),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.saudiRiyalSymbol,
                                    height:
                                    Get.height * Utils.getResponsiveHeight(12),
                                    width: Get.width * Utils.getResponsiveWidth(11),
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  SizedBox(width: Get.width * Utils.getResponsiveWidth(4),),
                                  Text(
                                    '30.00',
                                    style: TextStyle(
                                      color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.textPrimaryColor,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ],),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedMethod = 1;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: selectedMethod.isEqual(1) ? AppColor.cardSelectedBgColor : Theme.of(context).extension<AppColors>()?.cardBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Get.height * Utils.getResponsiveHeight(8),
                            ),
                          ),
                          border: Border.all(
                            color: selectedMethod.isEqual(1) ? AppColor.tabSelectedTextColor : Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * Utils.getResponsiveWidth(12),
                            vertical: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(IconAssets.icCard,
                                  color: selectedMethod.isEqual(1) ? AppColor.primaryIconColor : AppColor.textSecondaryColor,),
                                  SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
                                  Text(
                                    'card'.tr,
                                    style: TextStyle(
                                      color: selectedMethod.isEqual(1) ? AppColor.tabSelectedTextColor : AppColor.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: selectedMethod.isEqual(1) ? FontWeight.w600 : FontWeight.w500,
                                      fontSize:
                                          Get.height * Utils.getResponsiveSize(16),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topRight,
                                child: selectedMethod.isEqual(1) ? Icon(Icons.radio_button_checked,color: AppColor.primaryIconColor,) : Icon(Icons.radio_button_unchecked,color: AppColor.textSecondaryColor,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(24)),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedMethod = 2;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: selectedMethod.isEqual(2) ? AppColor.cardSelectedBgColor : Theme.of(context).extension<AppColors>()?.cardBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Get.height * Utils.getResponsiveHeight(8),
                            ),
                          ),
                          border: Border.all(
                            color: selectedMethod.isEqual(2) ? AppColor.tabSelectedTextColor : Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * Utils.getResponsiveWidth(12),
                            vertical: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(IconAssets.icWallet,
                                  color: selectedMethod.isEqual(2) ? AppColor.primaryIconColor : AppColor.textSecondaryColor,),
                                  SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
                                  Text(
                                    'wallet'.tr,
                                    style: TextStyle(
                                      color: selectedMethod.isEqual(2) ? AppColor.tabSelectedTextColor : AppColor.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: selectedMethod.isEqual(2) ? FontWeight.w600 : FontWeight.w500,
                                      fontSize:
                                      Get.height * Utils.getResponsiveSize(16),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topRight,
                                child: selectedMethod.isEqual(2) ? Icon(Icons.radio_button_checked,color: AppColor.primaryIconColor,) : Icon(Icons.radio_button_unchecked,color: AppColor.textSecondaryColor,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(24)),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedMethod = 3;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: selectedMethod.isEqual(3) ? AppColor.cardSelectedBgColor : Theme.of(context).extension<AppColors>()?.cardBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Get.height * Utils.getResponsiveHeight(8),
                            ),
                          ),
                          border: Border.all(
                            color: selectedMethod.isEqual(3) ? AppColor.tabSelectedTextColor : Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * Utils.getResponsiveWidth(12),
                            vertical: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(IconAssets.icMada,color: selectedMethod.isEqual(3) ? AppColor.primaryIconColor : AppColor.textSecondaryColor,),
                                  SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
                                  Text(
                                    'mada'.tr,
                                    style: TextStyle(
                                      color: selectedMethod.isEqual(3) ? AppColor.tabSelectedTextColor : AppColor.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: selectedMethod.isEqual(3) ? FontWeight.w600 : FontWeight.w500,
                                      fontSize:
                                      Get.height * Utils.getResponsiveSize(16),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topRight,
                                child: selectedMethod.isEqual(3) ? Icon(Icons.radio_button_checked,color: AppColor.primaryIconColor,) : Icon(Icons.radio_button_unchecked,color: AppColor.textSecondaryColor,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(46)),
              WithdrawButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
