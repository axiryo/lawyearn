import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/cache_network_image.dart';
import 'package:lawyearn/core/common/widgets/ptserif_text.dart';
import 'package:lawyearn/core/common/widgets/roboto_text.dart';
import 'package:lawyearn/core/constants/app_constants.dart';

class LawyersList extends StatelessWidget {
  const LawyersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.only(left: 16.sp),
          child: RobotoText(
            text: 'Lawyers near you',
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: Theme.of(context).primaryColor, width: 1.sp),
              bottom: BorderSide(
                  color: Theme.of(context).primaryColor, width: 1.sp),
              left: BorderSide.none,
              right: BorderSide.none,
            ),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: AppConstants.sampleList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 1.sp),
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.sp),
                          child: CacheNetworkImageWithPlaceholder(
                            height: 80.h,
                            imageUrl: AppConstants.sampleList[index],
                            width: 80.w,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.sp)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PTSerifText(
                                text: AppConstants.sampleNames[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              const RobotoText(
                                text:
                                    'A sample description about the lawyers experience in law firm. 5 years of experience in MVVM Suits industry.',
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8.h),
                              PTSerifText(
                                text: AppConstants.sampleExpertise[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(Icons.bookmark_outline),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: AppConstants.sampleList.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: EdgeInsets.only(bottom: 1.sp),
//               child: Container(
//                 color: Colors.grey,
//                 height: 160.h,
//                 child: Padding(
//                   padding: EdgeInsets.all(16.sp),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           flex: 3,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               PTSerifText(
//                                 text: AppConstants.sampleExpertise[index],
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 20.sp,
//                                   fontStyle: FontStyle.italic,
//                                 ),
//                               ),
//                               SizedBox(height: 16.h),
//                               RobotoText(text: AppConstants.sampleNames[index]),
//                             ],
//                           )),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           const Icon(Icons.bookmark_outline),
//                           SizedBox(height: 8.h),
//                           CacheNetworkImageWithPlaceholder(
//                             height: 80.h,
//                             imageUrl: AppConstants.sampleList[index],
//                             width: 80.w,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(12.sp)),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),