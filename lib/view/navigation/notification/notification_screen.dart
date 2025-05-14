import 'package:sanad/models/notification/notifications_model.dart';
import 'package:sanad/view/navigation/notification/widget/notification_cart_widget.dart';
import 'package:sanad/viewModels/controller/navigation/notification/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

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
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          leading: IconButton(
            icon: Image.asset(IconAssets.icArrowLeft),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text(
            'notifications'.tr,
            style: TextStyle(
              color: AppColor.textPrimaryColor,
              fontSize: Get.height * Utils.getResponsiveSize(24),
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
            ),
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColor.searchBarBorderColor,
              width: 1.0,
            ),
          ),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * Utils.getResponsiveWidth(16),
          ),
          child: Column(
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
          // child: Obx(() {
          //   // if (notificationVM.loading.value) {
          //   //   return const Center(child: CircularProgressIndicator());
          //   // }
          //   //
          //   // if (notificationVM.notificationDataList.isEmpty) {
          //   //   return Center(child: Text('no_notification'.tr));
          //   // }
          //   return ListView.builder(
          //     itemCount: notificationsItems.length,
          //     itemBuilder: (context, index) {
          //       return NotificationCartWidget(
          //         notifications: notificationsItems[index],
          //       );
          //     },
          //   );
          //
          //   // return ListView(
          //   //   children:
          //   //       notificationVM.groupedNotificationsList.entries
          //   //           .where((entry) => entry.value.isNotEmpty)
          //   //           .map(
          //   //             (entry) => Column(
          //   //               crossAxisAlignment: CrossAxisAlignment.start,
          //   //               children: [
          //   //                 SizedBox(
          //   //                   height:
          //   //                       Get.height * Utils.getResponsiveHeight(10),
          //   //                 ),
          //   //                 Text(
          //   //                   entry.key,
          //   //                   style: TextStyle(
          //   //                     color: AppColor.darkGrey,
          //   //                     fontSize:
          //   //                         Get.height * Utils.getResponsiveSize(14),
          //   //                     fontWeight: FontWeight.w600,
          //   //                     fontFamily: 'Manrope',
          //   //                   ),
          //   //                 ),
          //   //                 SizedBox(
          //   //                   height:
          //   //                       Get.height * Utils.getResponsiveHeight(10),
          //   //                 ),
          //   //                 ...entry.value.map(
          //   //                   (notification) => Padding(
          //   //                     padding: EdgeInsets.only(
          //   //                       bottom:
          //   //                           Get.height *
          //   //                           Utils.getResponsiveHeight(10),
          //   //                     ),
          //   //                     child: NotificationCartWidget(
          //   //                       notifications: notification,
          //   //                     ),
          //   //                   ),
          //   //                 ),
          //   //               ],
          //   //             ),
          //   //           )
          //   //           .toList(),
          //   // );
          //
          //   // return StreamBuilder<List<Notifications>>(
          //   //   stream: notificationVM.notifications,
          //   //   builder: (context, snapshot) {
          //   //     // if (snapshot.hasData) {
          //   //     return ListView.builder(
          //   //       itemCount: snapshot.data!.length,
          //   //       itemBuilder: (context, index) {
          //   //         return NotificationCartWidget(
          //   //           notifications: snapshot.data![index],
          //   //         );
          //   //       },
          //   //     );
          //   //     // }
          //   //     // return const Center(child: CircularProgressIndicator());
          //   //   },
          //   // );
          // }),
        ),
      ),
    );
  }
}
