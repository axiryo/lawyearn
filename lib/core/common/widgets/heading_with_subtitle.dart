import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingWithSubtitle extends StatelessWidget {
  final String heading;
  final String? subtitle;
  const HeadingWithSubtitle({super.key, required this.heading, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.sp,
              height: 1.h,
              wordSpacing: 0.8.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        if (subtitle != null && subtitle!.isNotEmpty) ...[
          Text(
            subtitle!,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8.h),
        ]
      ],
    );
  }
}
