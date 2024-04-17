import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/theme/app_palette.dart';

class DropFilterContainer extends StatelessWidget {
  const DropFilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          width: 160.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border:
                  Border.all(color: Colors.black.withOpacity(0.2), width: 2.5),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppPallete.whiteColor,
                  child: FittedBox(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
                Text(
                  'Noah Carter',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
