import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/cache_network_image.dart';
import 'package:lawyearn/core/constants/constants.dart';

class LawyersList extends StatelessWidget {
  const LawyersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Text(
            'Lawyers',
            style: TextStyle(fontSize: 20.sp),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Constants.sampleList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CacheNetworkImageWithPlaceholder(
                  height: 80.h,
                  imageUrl: Constants.sampleList[index],
                  width: double.maxFinite,
                  borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                  fit: BoxFit.fitWidth,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
