import 'package:sanad/models/jobs/jobs_list_model.dart';
import 'package:sanad/models/jobs/jobs_model.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/navigation/home/widget/input_location_widget.dart';
import 'package:sanad/view/navigation/home/widget/input_search_widget.dart';
import 'package:sanad/view/navigation/home/widget/jobs_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/navigation/home/jobs_view_model.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final jobsVM = Get.put(JobsViewModel());
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
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('home'.tr),
          titleTextStyle: TextStyle(
            color: AppColor.textPrimaryColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            fontSize: Get.height * Utils.getResponsiveSize(24),
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
              Container(
                height: Get.height * Utils.getResponsiveHeight(40),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Get.height * Utils.getResponsiveHeight(8)),
                  ),
                  border: Border.all(
                    color: AppColor.searchBarBorderColor,
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
                      width: Get.width * Utils.getResponsiveWidth(1),
                      color:
                          AppColor.searchBarBorderColor, // Color of the divider
                    ),
                    InputLocationWidget(),
                  ],
                ),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(21)),
              Text(
                'jobs_for_you'.tr,
                style: TextStyle(
                  color: AppColor.textPrimaryColor,
                  fontSize: Get.height * Utils.getResponsiveSize(18),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(4)),
              Text(
                'jobs_based_on_your_activity'.tr,
                style: TextStyle(
                  color: AppColor.textSecondaryColor,
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(5)),
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
