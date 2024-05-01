import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/constants/app_constants.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/service_locator.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    Profile? profile = getIt<GlobalUserProvider>().getUserProfile();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 16.sp),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => log('qr code clicked'),
                    icon: SvgPicture.asset('assets/images/qr_code.svg')),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Stack(children: [
                        SizedBox(
                          height: 100.h,
                          width: 100.w,
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
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: SvgPicture.asset(
                                    'assets/images/camera.svg',
                                    width: 12.w,
                                    height: 12.h,
                                  )),
                            ),
                          ),
                        ),
                      ]),
                      Text(
                        profile!.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () => log('share clicked'),
                    icon: SvgPicture.asset('assets/images/share.svg')),
              ],
            ),
            CustomPrimaryButton(
              buttonText: profile.isEmailVerified
                  ? 'Edit your profile'
                  : 'Finish your profile',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
