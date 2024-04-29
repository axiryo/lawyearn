import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/search_text_field.dart';
import 'package:lawyearn/features/account_settings/presentation/pages/account_settings_page.dart';
import 'package:lawyearn/features/home/presentation/widgets/home_app_bar.dart';
import 'package:lawyearn/features/home/presentation/widgets/home_feature_lawyers.dart';
import 'package:lawyearn/features/home/presentation/widgets/lawyers_list.dart';

class Homepage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const Homepage(),
      );
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onLeadingIconTap: () =>
            Navigator.push(context, AccountSettingsPage.route()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 0.sp),
              child: SearchTextField(onSearchChanged: (value) {}),
            ),
            const FeaturedLawyers(),
            const LawyersList(),
          ],
        ),
      ),
    );
  }
}
