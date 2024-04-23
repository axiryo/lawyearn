import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/core/common/widgets/custom_button_with_icon.dart';

class AuthSocialButtons extends StatelessWidget {
  const AuthSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonWithIcon(
          buttonText: 'Continue with Google',
          onPressed: () {},
          prefixIcon: SvgPicture.asset('assets/images/socials/google.svg',
              height: 24.h),
        ),
        SizedBox(height: 8.h),
        CustomButtonWithIcon(
          buttonText: 'Continue with Apple',
          onPressed: () {},
          prefixIcon:
              SvgPicture.asset('assets/images/socials/apple.svg', height: 24.h),
        ),
        SizedBox(height: 8.h),
        CustomButtonWithIcon(
          buttonText: 'Continue with Facebook',
          onPressed: () {},
          prefixIcon: SvgPicture.asset('assets/images/socials/facebook.svg',
              height: 24.h),
        ),
      ],
    );
  }
}
