import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Widget? prefixIcon;
  final Color? textColor;
  final Color? buttonColor;

  const CustomButtonWithIcon(
      {super.key,
      required this.buttonText,
      this.onPressed,
      this.prefixIcon,
      this.textColor,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        fixedSize: Size(double.maxFinite.w, 44.h),
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        disabledBackgroundColor: Theme.of(context).disabledColor,
        disabledForegroundColor: Theme.of(context).scaffoldBackgroundColor,
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: 12.w)],
          Text(buttonText),
        ],
      ),
    );
  }
}
