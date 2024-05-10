import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/common/widgets/cache_network_image.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/core/utils/extensions.dart';
import 'package:lawyearn/service_locator.dart';

class DisplayAvatar extends StatelessWidget {
  const DisplayAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    Profile? profile = getIt<GlobalUserProvider>().getUserProfile();
    return CacheNetworkImageWithPlaceholder(
      imageUrl: profile!.avatarUrl!,
      height: 120,
      width: 120,
      borderRadius: BorderRadius.all(Radius.circular(100.sp)),
      initials:
          '${profile.firstName.getFirstLetterCapitalized()} ${profile.lastName.getFirstLetterCapitalized()}',
    );
  }
}
