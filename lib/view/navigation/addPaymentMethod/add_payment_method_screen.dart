import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/input_account_name_widget.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/input_bank_name_widget.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/input_card_holder_name_widget.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/input_credit_card_number_widget.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/input_expiry_date_widget.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/input_iban_widget.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/input_security_code_widget.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/save_details_button_widget.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/custom_tab_bar_widget.dart';

import '../../../viewModels/controller/navigation/addPaymentMethod/add_payment_method_view_model.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  final addPaymentMethodVM = Get.put(AddPaymentMethodViewModel());
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
                height: Utils.getResponsiveHeight(context, 24),
                width: Utils.getResponsiveWidth(context, 24),
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text('payment_method'.tr),
            titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
            shape: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.getResponsiveWidth(context, 16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Utils.getResponsiveHeight(context, 40)),
                  Text(
                    'select_a_payment_method'.tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                      fontSize: Utils.getResponsiveSize(context, 18),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  CustomTabBar(),
                  SizedBox(height: Utils.getResponsiveHeight(context, 24)),
                  Divider(
                    color: Theme.of(context).dividerColor,
                    height: Utils.getResponsiveHeight(context, 1),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(context, 16)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(context, 16),
                        vertical: Utils.getResponsiveHeight(context, 16),
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Obx(() {
                              return addPaymentMethodVM.selectedTab.value ==
                                      'creditCard'
                                  ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'credit_card_number'.tr,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()
                                                  ?.textPrimaryColor,
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            14,
                                          ),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          8,
                                        ),
                                      ),
                                      InputCreditCardNumberWidget(),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          16,
                                        ),
                                      ),
                                      Text(
                                        'card_holder_name'.tr,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()
                                                  ?.textPrimaryColor,
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            14,
                                          ),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          8,
                                        ),
                                      ),
                                      InputCardHolderNameWidget(),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'expiry_date'.tr,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        Theme.of(context)
                                                            .extension<
                                                              AppColors
                                                            >()
                                                            ?.textPrimaryColor,
                                                    fontSize:
                                                        Utils.getResponsiveSize(
                                                          context,
                                                          14,
                                                        ),
                                                    fontFamily: 'Manrope',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      Utils.getResponsiveHeight(
                                                        context,
                                                        8,
                                                      ),
                                                ),
                                                InputExpiryDateWidget(),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Utils.getResponsiveWidth(
                                              context,
                                              16,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'security_code'.tr,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        Theme.of(context)
                                                            .extension<
                                                              AppColors
                                                            >()
                                                            ?.textPrimaryColor,
                                                    fontSize:
                                                        Utils.getResponsiveSize(
                                                          context,
                                                          14,
                                                        ),
                                                    fontFamily: 'Manrope',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      Utils.getResponsiveHeight(
                                                        context,
                                                        8,
                                                      ),
                                                ),
                                                InputSecurityCodeWidget(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                  : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'bank_name'.tr,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()
                                                  ?.textPrimaryColor,
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            14,
                                          ),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          8,
                                        ),
                                      ),
                                      InputBankNameWidget(),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          16,
                                        ),
                                      ),
                                      Text(
                                        'iban'.tr,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()
                                                  ?.textPrimaryColor,
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            14,
                                          ),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          8,
                                        ),
                                      ),
                                      InputIBANWidget(),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          16,
                                        ),
                                      ),
                                      Text(
                                        'account_name'.tr,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()
                                                  ?.textPrimaryColor,
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            14,
                                          ),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          8,
                                        ),
                                      ),
                                      InputAccountNameWidget(),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(
                                          context,
                                          16,
                                        ),
                                      ),
                                    ],
                                  );
                            }),
                          ),
                          SizedBox(
                            height: Utils.getResponsiveHeight(context, 20),
                          ),
                          SaveDetailsButtonWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
