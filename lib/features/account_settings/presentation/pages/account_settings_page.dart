import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/features/account_settings/presentation/widgets/account_settings_menu.dart';
import 'package:lawyearn/features/account_settings/presentation/widgets/accout_card.dart';
import 'package:lawyearn/features/account_settings/presentation/widgets/invite_friends.dart';

class AccountSettingsPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AccountSettingsPage(),
      );
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Account Settings',
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: const AccountCard(),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: const InviteFriends(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.sp),
                child: const AccountSettingsMenu(),
              ),
            ],
          ),
        ));
  }
}
