import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/features/account_settings/data/models/settings_menu.dart';
import 'package:lawyearn/features/account_settings/presentation/bloc/account_settings_bloc.dart';

class AccountSettingsMenu extends StatelessWidget {
  const AccountSettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SettingsMenuItem> settingsMenuItems = [
      SettingsMenuItem(
        title: 'Profile',
        onTap: () => log('Item 1 tapped'),
      ),
      SettingsMenuItem(
        title: 'Preferences',
        onTap: () => log('Item 2 tapped'),
      ),
      SettingsMenuItem(
        title: 'Log out',
        onTap: () async {
          context.read<AccountSettingsBloc>().add(AccountLogout());
        },
        trailing: Padding(
          padding: EdgeInsets.only(right: 4.sp),
          child: SvgPicture.asset(
            'assets/images/logout.svg',
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
            height: 16.h,
          ),
        ),
        leadingTextStyle: const TextStyle(color: Colors.red),
      ),
    ];
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
          itemCount: settingsMenuItems.length,
          itemBuilder: (context, index) {
            final item = settingsMenuItems[index];
            return ListTile(
              leading: Text(
                item.title,
                style: item.leadingTextStyle ?? const TextStyle(),
              ),
              onTap: item.onTap,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.sp, vertical: 4.sp),
              trailing:
                  item.trailing ?? const Icon(CupertinoIcons.chevron_forward),
            );
          },
        ),
      ],
    );
  }
}
