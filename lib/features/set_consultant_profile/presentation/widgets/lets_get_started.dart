import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/rubik_text.dart';
import 'package:lawyearn/core/constants/app_constants.dart';

class LetsGetStarted extends StatelessWidget {
  final PageController formController;
  const LetsGetStarted({super.key, required this.formController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 50.sp),
              RubikText(
                text: 'Let\'s get started!',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.sp),
              const RubikText(
                text: AppConstants.letsGetStartedMessage1,
              ),
              SizedBox(height: 8.sp),
              const RubikText(
                text: AppConstants.letsGetStartedMessage2,
              ),
              SizedBox(height: 8.sp),
              const RubikText(
                text: AppConstants.letsGetStartedMessage3,
              ),
              SizedBox(height: 8.sp),
              const RubikText(
                text: AppConstants.letsGetStartedMessage4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.sp),
        child: CustomPrimaryButton(
          buttonText: 'Start',
          onPressed: () => formController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
