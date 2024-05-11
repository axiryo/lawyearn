import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';

class BottomButtons extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onContinuePressed;
  final String? primaryButtonText;
  const BottomButtons({
    super.key,
    required this.onContinuePressed,
    required this.onBackPressed,
    this.primaryButtonText,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: CustomPrimaryButton(
            buttonText: 'Back',
            onPressed: onBackPressed,
            backgroundColor: colorScheme.onPrimary,
            foregroundColor: colorScheme.primary,
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(left: 8.sp),
            child: CustomPrimaryButton(
                buttonText: primaryButtonText ?? 'Continue',
                onPressed: onContinuePressed),
          ),
        ),
      ],
    );
  }
}
