import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/core/common/widgets/roboto_text.dart';
import 'package:lawyearn/features/set_consultant_profile/presentation/pages/set_consultant_profile_page.dart';

class OfferYourService extends StatelessWidget {
  const OfferYourService({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: () =>
          Navigator.of(context).push(SetConsultantProfilePage.route()),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 120.h),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RobotoText(
                  text: 'Offer your service',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                RobotoText(
                  text: 'Simple steps to set up shop. Offer your services now.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            'assets/images/lawyers_vector.svg',
            height: 104,
          ),
        ],
      ),
    );
  }
}
