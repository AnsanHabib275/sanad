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

  @override
  void initState() {
    super.initState();
    notificationVM.notificationListApi();
    // Listen for real-time updates
    notificationVM.notifications.listen((notifications) {
      notificationVM.notificationDataList.value = notifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          leading: IconButton(
            icon: Image.asset(IconAssets.icArrowLeft),
            onPressed: () => Get.back(),
          ),
          centerTitle: false,
          title: Text(
            'notifications'.tr,
            style: TextStyle(
              color: AppColor.blue,
              fontSize: Get.height * Utils.getResponsiveSize(20),
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
            ),
          ),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.bg),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(20),
              ),
              child: Obx(() {
                if (notificationVM.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (notificationVM.notificationDataList.isEmpty) {
                  return Center(child: Text('no_notification'.tr));
                }
                // return ListView.builder(
                //   itemCount: notificationVM.notificationDataList.length,
                //   itemBuilder: (context, index) {
                //     return NotificationCartWidget(
                //         notifications:
                //             notificationVM.notificationDataList[index]);
                //   },
                // );

                return ListView(
                  children:
                      notificationVM.groupedNotificationsList.entries
                          .where((entry) => entry.value.isNotEmpty)
                          .map(
                            (entry) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(10),
                                ),
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                    color: AppColor.darkGrey,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Manrope',
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(10),
                                ),
                                ...entry.value.map(
                                  (notification) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom:
                                          Get.height *
                                          Utils.getResponsiveHeight(10),
                                    ),
                                    child: NotificationCartWidget(
                                      notifications: notification,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                );
                // return StreamBuilder<List<Notifications>>(
                //   stream: notificationVM.notifications,
                //   builder: (context, snapshot) {
                //     // if (snapshot.hasData) {
                //     return ListView.builder(
                //       itemCount: snapshot.data!.length,
                //       itemBuilder: (context, index) {
                //         return NotificationCartWidget(
                //           notifications: snapshot.data![index],
                //         );
                //       },
                //     );
                //     // }
                //     // return const Center(child: CircularProgressIndicator());
                //   },
                // );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
