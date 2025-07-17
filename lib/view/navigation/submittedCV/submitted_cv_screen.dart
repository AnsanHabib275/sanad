import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/submittedCV/submitted_cv_model.dart';
import 'package:sanad/view/navigation/submittedCV/widget/submitted_cv_cart_widget.dart';
import 'package:sanad/viewModels/controller/navigation/notification/notification_view_model.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../utils/utils.dart';

class SubmittedCVScreen extends StatefulWidget {
  const SubmittedCVScreen({super.key});

  @override
  State<SubmittedCVScreen> createState() => _SubmittedCVScreenState();
}

class _SubmittedCVScreenState extends State<SubmittedCVScreen> {
  final notificationVM = Get.put(NotificationViewModel());

  final List<SubmittedCVModel> submittedCvItems = [
    SubmittedCVModel(
      1,
      'James Carter',
      'jamescarter@yahoo.com',
      '5 hours ago',
      'Senior UI/UX Designer',
      'Candidate Resume.pdf',
      true,
    ),
    SubmittedCVModel(
      2,
      'Daniel Whitaker',
      'Daniel Whitaker@yahoo.com',
      '7 hours ago',
      'UI/UX Designer',
      'Candidate Resume.pdf',
      false,
    ),
    SubmittedCVModel(
      3,
      'Michael Bennett',
      'Michael Bennett@yahoo.com',
      '8 hours ago',
      'UI/UX Designer',
      'Candidate Resume.pdf',
      false,
    ),
    SubmittedCVModel(
      4,
      'Edward Harrison',
      'Edward Harrison@yahoo.com',
      '8 hours ago',
      'Junior UI/UX Designer',
      'Candidate Resume.pdf',
      true,
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
          title: Text('submitted_cv'.tr),
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
                  itemCount: submittedCvItems.length,
                  separatorBuilder:
                      (context, index) => SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                  itemBuilder: (context, index) {
                    return SubmittedCVCartWidget(
                      submittedCVModel: submittedCvItems[index],
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
