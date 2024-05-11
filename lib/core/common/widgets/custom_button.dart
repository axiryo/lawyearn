import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const CustomPrimaryButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? colorScheme.primary,
          foregroundColor: foregroundColor ?? colorScheme.onPrimary,
          fixedSize: Size(double.maxFinite.w, 44.h),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
