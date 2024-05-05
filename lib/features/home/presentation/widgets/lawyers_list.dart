import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/cache_network_image.dart';
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
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: AppConstants.sampleList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => log('Lawyer #$index'),
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
                        borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RobotoText(
                                text: AppConstants.sampleNames[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => log('bookmark clicked'),
                                child: const Icon(Icons.bookmark_outline),
                              ),
                            ],
                          ),
                          const RobotoText(
                            text:
                                'A sample description about the lawyers experience in law firm. 5 years of experience in MVVM Suits industry.',
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          RobotoText(
                            text: AppConstants.sampleExpertise[index],
                            style: TextStyle(
                              color: Theme.of(context).highlightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
