import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/heading_with_subtitle.dart';

class AuthLoginSignupMessage extends StatelessWidget {
  const AuthLoginSignupMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        const HeadingWithSubtitle(
          heading: 'Log in or sign up',
        ),
      ],
    );
  }
}
