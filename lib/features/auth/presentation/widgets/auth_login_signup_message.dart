import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLoginSignupMessage extends StatelessWidget {
  const AuthLoginSignupMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          'Log in or sign up',
          style: TextStyle(
            fontSize: 26.sp,
            height: 1.h,
            wordSpacing: 0.8.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
