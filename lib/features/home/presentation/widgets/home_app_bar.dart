import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/cache_network_image.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/core/constants/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onLeadingIconTap;
  const HomeAppBar({super.key, required this.onLeadingIconTap});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Lawyearn',
      leading: Container(
        margin: EdgeInsets.fromLTRB(16.sp, 6.sp, 6.sp, 6.sp),
        child: const CircleAvatar(
          child: CacheNetworkImageWithPlaceholder(
            imageUrl: Constants.sampleProfilePic,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
      onLeadingIconTap: onLeadingIconTap,
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(0.sp, 0.sp, 12.sp, 0.sp),
          child: IconButton(
            onPressed: () => log('notif clicked'),
            icon: const Badge(child: Icon(Icons.notifications)),
            iconSize: 28.sp,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
