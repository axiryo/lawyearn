import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettingsMenu extends StatelessWidget {
  const AccountSettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
          child: Text(
            'Settings menu',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('asd$index'),
              onTap: () => log('clicked $index'),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.sp, vertical: 4.sp),
              trailing: const Icon(CupertinoIcons.chevron_forward),
            );
          },
        ),
      ],
    );
  }
}
