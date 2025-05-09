import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/urls/app_url.dart';
import '../../../../models/notification/notification_list_model.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/navigation/notification/notification_view_model.dart';

class NotificationCartWidget extends StatefulWidget {
  final Notifications notifications;

  const NotificationCartWidget({super.key, required this.notifications});

  @override
  State<NotificationCartWidget> createState() => _NotificationCartWidgetState();
}

class _NotificationCartWidgetState extends State<NotificationCartWidget> {
  final notificationVM = Get.put(NotificationViewModel());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * Utils.getResponsiveHeight(98),
      child: InkWell(
        onTap: () {
          if (!(widget.notifications.isViewed!)) {
            notificationVM.markNotificationViewedApi(
              widget.notifications.notificationId.toString(),
            );
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(Get.height * Utils.getResponsiveHeight(12)),
                ),
                border: Border.all(
                  color:
                      widget.notifications.isViewed!
                          ? AppColor.extraDarkGreyWith50Per
                          : AppColor.transparent,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  Get.height * Utils.getResponsiveHeight(15),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height * Utils.getResponsiveHeight(46),
                        width: Get.width * Utils.getResponsiveWidth(46),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Get.height * Utils.getResponsiveSize(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Get.height * Utils.getResponsiveSize(10),
                          ),
                          child:
                              widget.notifications.photos == null &&
                                      widget.notifications.photos!.isEmpty
                                  ? Image.asset(
                                    ImageAssets.appLogo,
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(46),
                                    width:
                                        Get.width *
                                        Utils.getResponsiveWidth(46),
                                    fit: BoxFit.cover,
                                  )
                                  : Image.network(
                                    AppUrl.baseUrl +
                                        widget.notifications.photos!.first,
                                    // 'https://vld-api-v1.beweb3.com/uploads/638732101153369427dummy_profile.png',
                                    fit: BoxFit.cover,
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(46),
                                    width:
                                        Get.width *
                                        Utils.getResponsiveWidth(46),
                                    loadingBuilder: (
                                      context,
                                      child,
                                      loadingProgress,
                                    ) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value:
                                              loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      (loadingProgress
                                                              .expectedTotalBytes ??
                                                          1)
                                                  : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        ImageAssets.appLogo,
                                        height:
                                            Get.height *
                                            Utils.getResponsiveHeight(46),
                                        width:
                                            Get.width *
                                            Utils.getResponsiveWidth(46),
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                        ),
                      ),
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(12)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'products_with_qr_code_no'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(16),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.lightGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        widget.notifications.qRCodeNo
                                            .toString(),
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(16),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.lightGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * Utils.getResponsiveHeight(4),
                            ),
                            Text(
                              widget.notifications.detail.toString(),
                              style: TextStyle(
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                color: AppColor.extraLightGrey,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * Utils.getResponsiveHeight(4),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'scanned_on'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: Utils.scanFormatDate(
                                      widget.notifications.complaintDate
                                          .toString(),
                                    ),
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
