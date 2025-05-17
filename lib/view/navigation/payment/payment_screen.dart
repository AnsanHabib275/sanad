import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/payment/payment_model.dart';
import 'package:sanad/view/navigation/payment/widget/payment_cart_widget.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';
import '../../../viewModels/controller/navigation/payments/payments_view_model.dart';
import '../payment//widget/input_search_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final paymentsVM = Get.put(PaymentsViewModel());
  final List<PaymentModel> paymentItems = [
    PaymentModel('P-ID-001','Dec 12, 2024', '\$2300', 'Expired'),
    PaymentModel('P-ID-002','Dec 12, 2024', '-\$670', 'Hired'),
    PaymentModel('P-ID-003','Dec 12, 2024', '\$234', 'Running'),
    PaymentModel('P-ID-004','Dec 12, 2024', '\$5000', 'Expired'),
    PaymentModel('P-ID-005','Dec 12, 2024', '\$2300', 'Running'),
    PaymentModel('P-ID-006','Dec 12, 2024', '\$560', 'Hired'),
  ];
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          leading: IconButton(
            icon: Image.asset(IconAssets.icArrowLeft,
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('payments'.tr),
          titleTextStyle: TextStyle(
            color: AppColor.textPrimaryColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            fontSize: Get.height * Utils.getResponsiveSize(24),
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColor.searchBarBorderColor,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
              InputSearchWidget(
                onSearch: (query) => paymentsVM.filterPayment(query),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(12)),
              Flexible(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(12),
                      ),
                    ),
                    border: Border.all(
                      color: AppColor.searchBarBorderColor,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        child: Text(
                          'payment_history'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColor.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(16),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(4),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        child: Text(
                          'track_your_list_of_payment_here'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColor.textSecondaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(12),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      Container(
                        height: Get.height * Utils.getResponsiveHeight(50),
                        width: double.infinity,
                        color: AppColor.appBarLightBackground,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(97),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width * Utils.getResponsiveWidth(5),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
                                  ),
                                  child: Text(
                                    'payment_capital'.tr,
                                    style: TextStyle(
                                      color: AppColor.textBodyColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(97),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width * Utils.getResponsiveWidth(5),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
                                  ),
                                  child: Text(
                                    'amount'.tr,
                                    style: TextStyle(
                                      color: AppColor.textBodyColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(127),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width * Utils.getResponsiveWidth(5),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
                                  ),
                                  child: Text(
                                    'status'.tr,
                                    style: TextStyle(
                                      color: AppColor.textBodyColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(74),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width * Utils.getResponsiveWidth(5),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
                                  ),
                                  child: Text(
                                    'action'.tr,
                                    style: TextStyle(
                                      color: AppColor.textBodyColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: paymentItems.length,
                          itemBuilder: (context, index) {
                            return PaymentCartWidget(
                              payment: paymentItems[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
