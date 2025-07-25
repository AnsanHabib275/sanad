import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/view/navigation/paymentMethod/widget/add_payment_method_button_widget.dart';
import 'package:sanad/view/navigation/paymentMethod/widget/payment_method_cart_widget.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../models/paymentMethod/payment_method_model.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final List<PaymentMethodModel> paymentMethodItems = [
    PaymentMethodModel(
      '0',
      ImageAssets.imgMasterCard,
      'Master Card',
      '2107',
      '10/26',
    ),
    PaymentMethodModel('1', ImageAssets.imgMasterCard, 'Visa', '5689', '10/26'),
    PaymentMethodModel(
      '2',
      ImageAssets.imgMasterCard,
      'American Express',
      '5689',
      '10/26',
    ),
    PaymentMethodModel(
      '3',
      ImageAssets.imgMasterCard,
      'Maestro',
      '5689',
      '10/26',
    ),
  ];

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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Utils.getResponsiveWidth(context, 16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Utils.getResponsiveHeight(context, 25)),
              Text(
                'payment_methods'.tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textPrimaryColor,
                  fontSize: Utils.getResponsiveSize(context, 16),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: Utils.getResponsiveHeight(context, 8)),
              Text(
                'payment_methods_detail'.tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color:
                      Theme.of(context).extension<AppColors>()?.textBodyColor,
                  fontSize: Utils.getResponsiveSize(context, 12),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Utils.getResponsiveHeight(context, 24)),
              AddPaymentMethodButtonWidget(),
              SizedBox(height: Utils.getResponsiveHeight(context, 24)),
              ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: paymentMethodItems.length,
                itemBuilder: (context, index) {
                  return PaymentMethodCartWidget(
                    paymentMethod: paymentMethodItems[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
