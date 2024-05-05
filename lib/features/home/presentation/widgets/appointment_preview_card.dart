import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/roboto_text.dart';

class AppointmentPreviewCard extends StatelessWidget {
  const AppointmentPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: Theme.of(context).highlightColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Center(
                    child: RobotoText(
                      text: 'No appointment',
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 8.h,
            margin: EdgeInsets.symmetric(horizontal: 12.sp),
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor.withOpacity(0.25),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8.sp),
              ),
            ),
          ),
          Container(
            height: 8.h,
            margin: EdgeInsets.symmetric(horizontal: 24.sp),
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor.withOpacity(0.15),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
