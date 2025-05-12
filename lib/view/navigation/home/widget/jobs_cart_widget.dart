import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/jobs/jobs_list_model.dart';
import 'package:sanad/viewModels/controller/navigation/home/jobs_view_model.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/urls/app_url.dart';
import '../../../../utils/utils.dart';

class JobsCartWidget extends StatefulWidget {
  final Jobs jobs;

  const JobsCartWidget({super.key, required this.jobs});

  @override
  State<JobsCartWidget> createState() => _JobsCartWidgetState();
}

class _JobsCartWidgetState extends State<JobsCartWidget> {
  @override
  Widget build(BuildContext context) {
    final jobsVM = Get.find<JobsViewModel>();
    return SizedBox(
      width: double.infinity,
      height: Get.height * Utils.getResponsiveHeight(82),
      child: Obx(() {
        return InkWell(
          onTap: () {},
          child: Card(
            color: AppColor.dimBlack,
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColor.searchBarBorderColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(
                Get.height * Utils.getResponsiveSize(8),
              ),
            ),
            // child: Padding(
            //   padding: EdgeInsets.symmetric(
            //     vertical: Get.height * Utils.getResponsiveHeight(15),
            //     horizontal: Get.width * Utils.getResponsiveWidth(15),
            //   ),
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Container(
            //           height: Get.height * Utils.getResponsiveHeight(50),
            //           width: Get.width * Utils.getResponsiveWidth(50),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(
            //               Get.height * Utils.getResponsiveSize(10),
            //             ),
            //           ),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(
            //               Get.height * Utils.getResponsiveSize(10),
            //             ),
            //             child:
            //                 (widget.complaints.complaintPhotos != null &&
            //                         widget
            //                             .complaints
            //                             .complaintPhotos!
            //                             .isNotEmpty)
            //                     ? Image.network(
            //                       AppUrl.baseUrl +
            //                           widget.complaints.complaintPhotos!.first,
            //                       fit: BoxFit.cover,
            //                       height:
            //                           Get.height *
            //                           Utils.getResponsiveHeight(50),
            //                       width:
            //                           Get.width * Utils.getResponsiveWidth(50),
            //                       loadingBuilder: (
            //                         context,
            //                         child,
            //                         loadingProgress,
            //                       ) {
            //                         if (loadingProgress == null) return child;
            //                         return Center(
            //                           child: CircularProgressIndicator(
            //                             value:
            //                                 loadingProgress
            //                                             .expectedTotalBytes !=
            //                                         null
            //                                     ? loadingProgress
            //                                             .cumulativeBytesLoaded /
            //                                         (loadingProgress
            //                                                 .expectedTotalBytes ??
            //                                             1)
            //                                     : null,
            //                           ),
            //                         );
            //                       },
            //                       errorBuilder: (context, error, stackTrace) {
            //                         return Image.asset(
            //                           ImageAssets.imgScan,
            //                           height:
            //                               Get.height *
            //                               Utils.getResponsiveHeight(50),
            //                           width:
            //                               Get.width *
            //                               Utils.getResponsiveWidth(50),
            //                           fit: BoxFit.cover,
            //                         );
            //                       },
            //                     )
            //                     : Image.asset(
            //                       ImageAssets.imgScan,
            //                       height:
            //                           Get.height *
            //                           Utils.getResponsiveHeight(50),
            //                       width:
            //                           Get.width * Utils.getResponsiveWidth(50),
            //                       fit: BoxFit.cover,
            //                     ),
            //           ),
            //         ),
            //         SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
            //         Expanded(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   children: [
            //                     TextSpan(
            //                       text: 'complaint_product_id'.tr,
            //                       style: TextStyle(
            //                         fontSize:
            //                             Get.height *
            //                             Utils.getResponsiveSize(16),
            //                         fontFamily: 'Manrope',
            //                         fontWeight: FontWeight.w600,
            //                         color: AppColor.lightGrey,
            //                       ),
            //                     ),
            //                     TextSpan(
            //                       text:
            //                           widget.complaints.productId
            //                               .toString(), // The number
            //                       style: TextStyle(
            //                         fontSize:
            //                             Get.height *
            //                             Utils.getResponsiveSize(16),
            //                         fontFamily: 'Manrope',
            //                         fontWeight: FontWeight.w500,
            //                         color:
            //                             AppColor
            //                                 .lightGrey, // Normal font weight for the number
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: Get.height * Utils.getResponsiveHeight(5),
            //               ),
            //               RichText(
            //                 text: TextSpan(
            //                   children: [
            //                     TextSpan(
            //                       text:
            //                           complaintsVM.isSolved.value
            //                               ? 'resolved_on'.tr
            //                               : 'added_on'.tr,
            //                       style: TextStyle(
            //                         fontSize:
            //                             Get.height *
            //                             Utils.getResponsiveSize(14),
            //                         fontFamily: 'Manrope',
            //                         fontWeight: FontWeight.w400,
            //                         color:
            //                             complaintsVM.isSolved.value
            //                                 ? AppColor.original
            //                                 : AppColor.grey,
            //                       ),
            //                     ),
            //                     TextSpan(
            //                       text: Utils.scanFormatDate(
            //                         widget.complaints.datetime.toString(),
            //                       ), // The number
            //                       style: TextStyle(
            //                         fontSize:
            //                             Get.height *
            //                             Utils.getResponsiveSize(14),
            //                         fontFamily: 'Manrope',
            //                         fontWeight: FontWeight.w400,
            //                         color:
            //                             complaintsVM.isSolved.value
            //                                 ? AppColor.original
            //                                 : AppColor.grey,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         // imgChatMsgDisable
            //         complaintsVM.isSolved.value
            //             ? Image.asset(ImageAssets.imgChatMsgDisable)
            //             : InkWell(
            //               onTap: () {
            //                 Get.toNamed(RoutesName.adminChatScreen);
            //               },
            //               child: Image.asset(ImageAssets.imgChatMsgEnable),
            //             ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        );
      }),
    );
  }
}
