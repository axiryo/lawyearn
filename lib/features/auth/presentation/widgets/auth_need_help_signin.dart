import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthNeedHelpSignIn extends StatelessWidget {
  const AuthNeedHelpSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SizedBox(height: 24.h),
        Text('Need help signing in?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorScheme.secondary,
            )),
        SizedBox(height: 24.h),
      ],
    );
  }
}
