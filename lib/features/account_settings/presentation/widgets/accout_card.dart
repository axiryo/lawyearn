import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/roboto_text.dart';
import 'package:lawyearn/core/constants/app_constants.dart';
import 'package:lawyearn/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    SupabaseClient sClient = getIt<SupabaseClient>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: const CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            AppConstants.sampleProfilePic),
                      ),
                    ),
                    Positioned(
                      bottom: -2.sp,
                      right: -4.sp,
                      child: IconButton(
                        onPressed: () => log('camera clicked'),
                        icon: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: CircleAvatar(
                              child: SvgPicture.asset(
                            'assets/images/camera.svg',
                            width: 12.w,
                            height: 12.h,
                          )),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            IconButton(
              onPressed: () => log('qr code clicked'),
              icon: SvgPicture.asset(
                'assets/images/qr_code.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
            IconButton(
              onPressed: () => log('share clicked'),
              icon: SvgPicture.asset(
                'assets/images/share.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
          ],
        ),
        RobotoText(
          text: 'Allison Williams',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        RobotoText(
          text: 'Tax lawyer at Netflix',
          style: TextStyle(
            color: colorScheme.shadow,
            fontSize: 16.sp,
          ),
        ),
        RobotoText(
          text: 'Pembo Makati City',
          style: TextStyle(
            color: colorScheme.shadow,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 16.h),
        CustomPrimaryButton(
          buttonText: 'Edit',
          onPressed: () => log(sClient.auth.currentUser!.userMetadata!['name']),
          height: 40.h,
        ),
        // SizedBox(height: 16.h),
        // const InviteFriends(),
        // SizedBox(height: 16.h),
      ],
    );
  }
}
