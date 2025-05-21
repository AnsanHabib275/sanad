import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/myJobs/widget/custom_tab_bar_widget.dart';
import 'package:sanad/view/navigation/myJobs/widget/my_jobs_cart_widget.dart';
import '../../../models/myJobs/my_jobs_model.dart';
import '../../../utils/utils.dart';

class MyJobsScreen extends StatefulWidget {
  const MyJobsScreen({super.key});

  @override
  State<MyJobsScreen> createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {
  final List<MyJobsModel> myJobsItems = [
    MyJobsModel(
      1,
      'UX UI Designer',
      true,
      'ABC Design Agency ',
      'XYX Location',
      'Full Time',
      '10,000 to 20,000',
      'Applied (4)',
    ),
    MyJobsModel(
      2,
      'UX UI Designer',
      true,
      'ABC Design Agency ',
      'XYX Location',
      'Full Time',
      '10,000 to 20,000',
      'Applied (2)',
    ),
    MyJobsModel(
      3,
      'UX UI Designer',
      true,
      'ABC Design Agency ',
      'XYX Location',
      'Full Time',
      '10,000 to 20,000',
      'Applied',
    ),
    MyJobsModel(
      4,
      'UX UI Designer',
      true,
      'ABC Design Agency ',
      'XYX Location',
      'Full Time',
      '10,000 to 20,000',
      'Applied',
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
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('my_jobs'.tr),
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
              CustomTabBar(),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
              Expanded(
                child: ListView.builder(
                  itemCount: myJobsItems.length,
                  itemBuilder: (context, index) {
                    return MyJobsCartWidget(myJobs: myJobsItems[index]);
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
