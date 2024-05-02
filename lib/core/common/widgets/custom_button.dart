import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double? height;
  const CustomPrimaryButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          disabledBackgroundColor: Theme.of(context).disabledColor,
          disabledForegroundColor: Theme.of(context).scaffoldBackgroundColor,
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
