import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/recruiter/payment/payment_model.dart';
import 'package:sanad/view/recruiter/navigation/payment/widget/payment_cart_widget.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/recruiter/navigation/payments/payments_view_model.dart';
import 'widget/input_search_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final paymentsVM = Get.put(PaymentsViewModel());
  final List<PaymentModel> paymentItems = [
    PaymentModel('P-ID-001', 'Dec 12, 2024', '\$2300', 'Expired','UI/UX Designer','Emma Caldwell'),
    PaymentModel('P-ID-002', 'Dec 12, 2024', '-\$670', 'Hired','Backend Dev','Emma Caldwell'),
    PaymentModel('P-ID-003', 'Dec 12, 2024', '\$234', 'Running','Frontend Dev','Emma Caldwell'),
    PaymentModel('P-ID-004', 'Dec 12, 2024', '\$5000', 'Expired','UI/UX Designer','Emma Caldwell'),
    PaymentModel('P-ID-005', 'Dec 12, 2024', '\$2300', 'Running','Graphic Designer','Emma Caldwell'),
    PaymentModel('P-ID-006', 'Dec 12, 2024', '\$560', 'Hired','UI/UX Designer','Emma Caldwell'),
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
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('payments'.tr),
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
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(12),
                      ),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
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
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
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
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
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
                        color:
                            Theme.of(context).extension<AppColors>()?.containerBg,
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
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
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
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
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
                                    'job_title'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
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
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
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
