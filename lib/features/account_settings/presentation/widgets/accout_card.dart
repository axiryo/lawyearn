import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/display_avatar.dart';
import 'package:lawyearn/core/common/widgets/roboto_text.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/core/utils/pick_image.dart';
import 'package:lawyearn/features/edit_profile.dart/presentation/pages/edit_profile_page.dart';
import 'package:lawyearn/service_locator.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({super.key});

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Profile? profile = getIt<GlobalUserProvider>().getUserProfile();
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
                    image == null
                        ? const DisplayAvatar()
                        : SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.sp)),
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: -2.sp,
                      right: -4.sp,
                      child: IconButton(
                        onPressed: () => selectImage(),
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
          text: '${profile!.firstName} ${profile.lastName}',
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
        const SizedBox(height: 16),
        CustomPrimaryButton(
          buttonText: 'Edit',
          onPressed: () => Navigator.of(context).push(EditProfilePage.route()),
          height: 40.h,
        ),
      ],
    );
  }
}
