import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/navigation/home/widget/input_location_widget.dart';
import 'package:sanad/view/navigation/home/widget/input_search_widget.dart';
import 'package:sanad/view/navigation/home/widget/jobs_cart_widget.dart';
import 'package:sanad/viewModels/controller/navigation/home/home_view_model.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../models/home/jobs_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final jobsVM = Get.put(HomeViewModel());
  final List<JobsModel> jobsItems = [
    JobsModel(
      1,
      'UX UI Designer',
      true,
      'ABC Design Agency ',
      'XYX Location',
      'Full Time',
      '10,000 to 20,000',
    ),
    JobsModel(
      2,
      'UX UI Designer',
      false,
      'ABC Design Agency ',
      'XYX Location',
      'Full Time',
      '10,000 to 20,000',
    ),
    JobsModel(
      3,
      'UX UI Designer',
      true,
      'ABC Design Agency ',
      'XYX Location',
      'Full Time',
      '10,000 to 20,000',
    ),
    JobsModel(
      4,
      'UX UI Designer',
      true,
      'ABC Design Agency ',
      'XYX Location',
      'Full Time',
      '10,000 to 20,000',
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
          title: Text('home'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RoutesName.notificationScreen);
              },
              child: Image.asset(
                IconAssets.icNotificationsFilled,
                height: Utils.getResponsiveHeight(24),
                width: Utils.getResponsiveWidth(24),
              ),
            ),
            SizedBox(width: Utils.getResponsiveWidth(16)),
          ],
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Utils.getResponsiveWidth(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Utils.getResponsiveHeight(16)),
              Container(
                height: Utils.getResponsiveHeight(40),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).extension<AppColors>()?.cardBg,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Utils.getResponsiveSize(8)),
                  ),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InputSearchWidget(
                        onSearch: (query) => jobsVM.filterJobs(query),
                      ),
                    ),
                    VerticalDivider(
                      width: Utils.getResponsiveWidth(1),
                      color: Theme.of(context).dividerColor,
                    ),
                    InputLocationWidget(),
                  ],
                ),
              ),
              SizedBox(height: Utils.getResponsiveHeight(21)),
              Text(
                'jobs_for_you'.tr,
                style: TextStyle(
                  color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textPrimaryColor,
                  fontSize: Utils.getResponsiveSize(18),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: Utils.getResponsiveHeight(4)),
              Text(
                'jobs_based_on_your_activity'.tr,
                style: TextStyle(
                  color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textSecondaryColor,
                  fontSize: Utils.getResponsiveSize(14),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Utils.getResponsiveHeight(5)),
              Expanded(
                child: ListView.builder(
                  itemCount: jobsItems.length,
                  itemBuilder: (context, index) {
                    return JobsCartWidget(jobs: jobsItems[index]);
                  },
                ),
              ),

              // Expanded(
              //   child: Obx(() {
              //     if (jobsVM.loading.value) {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //
              //     if (jobsVM.error.isNotEmpty) {
              //       return Center(child: Text(jobsVM.error.value));
              //     }
              //
              //     if (jobsVM.filteredJobsDataList.isEmpty) {
              //       return Center(child: Text('no_jobs'.tr));
              //     }
              //     return RefreshIndicator(
              //       onRefresh: () async {
              //         Get.find<UserPreference>().userEid.value;
              //         await jobsVM.jobsListApi();
              //       },
              //       child: ListView.separated(
              //         physics: AlwaysScrollableScrollPhysics(),
              //         itemCount: jobsVM.filteredJobsDataList.length,
              //         separatorBuilder:
              //             (context, index) => SizedBox(height: 16),
              //         itemBuilder: (context, index) {
              //           if (index >= jobsVM.filteredJobsDataList.length) {
              //             return SizedBox.shrink();
              //           }
              //
              //           final job = jobsVM.filteredJobsDataList[index];
              //           return JobsCartWidget(
              //             jobs: job,
              //             key: ValueKey(job.jobId), // Important for state
              //           );
              //         },
              //       ),
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
