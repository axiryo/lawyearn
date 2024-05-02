import 'package:flutter/material.dart';
import 'package:lawyearn/features/home/presentation/widgets/home_app_bar.dart';
import 'package:lawyearn/features/home/presentation/widgets/featured_lawyers.dart';
import 'package:lawyearn/features/home/presentation/widgets/lawyers_list.dart';

class Homepage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const Homepage(),
      );
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 0.sp),
            //   child: SearchTextField(onSearchChanged: (value) {}),
            // ),
            FeaturedLawyers(),
            LawyersList(),
          ],
        ),
      ),
    );
  }
}
