import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../viewModels/controller/navigation/paymentMethod/payment_method_view_model.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  final paymentMethodVM = Get.put(PaymentMethodViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Utils.getResponsiveHeight(44),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.tabsBg,
        border: Border.all(
          // color: Theme.of(context).extension<AppColors>()?.tabsBorderColor,
          color: Theme.of(context).dividerColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Utils.getResponsiveHeight(10)),
        ),
      ),
      child: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Utils.getResponsiveWidth(4),
            vertical: Utils.getResponsiveHeight(4),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    paymentMethodVM.setSelectionTab('creditCard');
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          paymentMethodVM.selectedTab.value == 'creditCard'
                              ? Theme.of(
                                context,
                              ).extension<AppColors>()?.selectedTabsBg
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(6)),
                      ),
                    ),
                    child: Text(
                      'credit_card'.tr,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(14),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        color:
                            paymentMethodVM.selectedTab.value == 'creditCard'
                                ? AppColor.primaryButtonColor
                                : AppColor.textSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    paymentMethodVM.setSelectionTab('bankAccount');
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          paymentMethodVM.selectedTab.value == 'bankAccount'
                              ? Theme.of(
                                context,
                              ).extension<AppColors>()?.selectedTabsBg
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(6)),
                      ),
                    ),
                    child: Text(
                      'bank_account'.tr,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(14),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        color:
                            paymentMethodVM.selectedTab.value == 'bankAccount'
                                ? AppColor.primaryButtonColor
                                : AppColor.textSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
