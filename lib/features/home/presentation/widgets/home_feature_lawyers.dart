import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/cache_network_image.dart';
import 'package:lawyearn/core/common/widgets/roboto_text.dart';
import 'package:lawyearn/core/constants/app_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FeaturedLawyers extends StatelessWidget {
  const FeaturedLawyers({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentPageIndex = ValueNotifier<int>(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.sp),
          child: RobotoText(
            text: 'Featured Lawyers',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        CarouselSlider(
          items: AppConstants.sampleList
              .map((e) => CacheNetworkImageWithPlaceholder(
                    imageUrl: e,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 0.9,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              currentPageIndex.value = index;
            },
          ),
        ),
        SizedBox(height: 8.h),
        ValueListenableBuilder<int>(
          valueListenable: currentPageIndex,
          builder: (context, value, child) {
            return Center(
              child: AnimatedSmoothIndicator(
                activeIndex: value,
                count: AppConstants.sampleList.length,
                effect: ExpandingDotsEffect(
                  radius: 8,
                  spacing: 10,
                  dotHeight: 8.h,
                  dotWidth: 8.h,
                  activeDotColor: Theme.of(context).highlightColor,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
