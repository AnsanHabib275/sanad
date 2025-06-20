import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/recruiter/notification/notifications_model.dart';
import 'package:sanad/view/recruiter/navigation/notification/widget/dismiss_button_widget.dart';
import 'package:sanad/view/recruiter/navigation/notification/widget/dismiss_large_button_widget.dart';
import 'package:sanad/view/recruiter/navigation/notification/widget/submit_button_widget.dart';

import '../../../../../res/assets/image_assets.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../../viewModels/controller/recruiter/navigation/notification/notification_view_model.dart';

class NotificationCartWidget extends StatefulWidget {
  // final Notifications notifications;
  final NotificationsModel notifications;

  const NotificationCartWidget({super.key, required this.notifications});

  @override
  State<NotificationCartWidget> createState() => _NotificationCartWidgetState();
}

class _NotificationCartWidgetState extends State<NotificationCartWidget> {
  final notificationVM = Get.put(NotificationViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.cardBg,
        borderRadius: BorderRadius.all(
          Radius.circular(Get.height * Utils.getResponsiveHeight(4)),
        ),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(Get.height * Utils.getResponsiveHeight(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: Get.height * Utils.getResponsiveSize(24),
              child:
                  widget.notifications.notificationImage.isEmpty
                      ? Image.asset(
                        ImageAssets.imgDummyProfile,
                        height: Get.height * Utils.getResponsiveHeight(48),
                        width: Get.width * Utils.getResponsiveWidth(48),
                        fit: BoxFit.cover,
                      )
                      : ClipOval(
                        child: Image.network(
                          widget.notifications.notificationImage,
                          height: Get.height * Utils.getResponsiveHeight(48),
                          width: Get.width * Utils.getResponsiveWidth(48),
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
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
                              ImageAssets.imgDummyPicture,
                              height:
                                  Get.height * Utils.getResponsiveHeight(48),
                              width: Get.width * Utils.getResponsiveWidth(48),
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(12)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.notifications.notificationTitle,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(18),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  Text(
                    widget.notifications.notificationDescription,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textBodyColor,
                    ),
                  ),
                  widget.notifications.notificationType == 'invitation'
                      ? Padding(
                        padding: EdgeInsets.only(
                          top: Get.height * Utils.getResponsiveHeight(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: DismissButtonWidget()),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(12),
                            ),
                            Expanded(child: SubmitButtonWidget()),
                          ],
                        ),
                      )
                      : widget.notifications.notificationType == 'closed'
                      ? Padding(
                        padding: EdgeInsets.only(
                          top: Get.height * Utils.getResponsiveHeight(12),
                        ),
                        child: DismissLargeButtonWidget(),
                      )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
