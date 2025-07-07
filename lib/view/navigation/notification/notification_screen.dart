import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/notification/notifications_model.dart';
import 'package:sanad/view/navigation/notification/widget/notification_cart_widget.dart';
import 'package:sanad/viewModels/controller/navigation/notification/notification_view_model.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../utils/utils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationVM = Get.put(NotificationViewModel());

  // @override
  // void initState() {
  //   super.initState();
  //   notificationVM.notificationListApi();
  //   // Listen for real-time updates
  //   notificationVM.notifications.listen((notifications) {
  //     notificationVM.notificationDataList.value = notifications;
  //   });
  // }

  final List<NotificationsModel> notificationsItems = [
    NotificationsModel(
      1,
      'invitation',
      'https://partnershelpingpeople.com//ProfilePhotos/userimg638741901514451451.png',
      'Job Invitation',
      'Lorem ipsum dolor sit amet, consectetur adipisci elit ',
    ),
    NotificationsModel(
      2,
      'downloaded',
      'https://partnershelpingpeople.com//ProfilePhotos/userimg638741901514451451.png',
      'Cv is downloaded',
      'Lorem ipsum dolor sit amet, consectetur adipisci elit ',
    ),
    NotificationsModel(
      3,
      'closed',
      'https://partnershelpingpeople.com//ProfilePhotos/userimg638741901514451451.png',
      'Job is closed',
      'Lorem ipsum dolor sit amet, consectetur adipisci elit ',
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
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('notifications'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Theme.of(context).dividerColor,
              height: 1.0,
            ),
          ),
          // shape: Border(
          //   bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
          // ),
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
              Expanded(
                child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: notificationsItems.length,
                  separatorBuilder:
                      (context, index) => SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                  itemBuilder: (context, index) {
                    return NotificationCartWidget(
                      notifications: notificationsItems[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
