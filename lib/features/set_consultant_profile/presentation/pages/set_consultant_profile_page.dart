import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/features/set_consultant_profile/presentation/widgets/add_an_id.dart';
import 'package:lawyearn/features/set_consultant_profile/presentation/widgets/bottom_buttons.dart';
import 'package:lawyearn/features/set_consultant_profile/presentation/widgets/enter_your_name.dart';
import 'package:lawyearn/features/set_consultant_profile/presentation/widgets/lets_get_started.dart';

class SetConsultantProfilePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SetConsultantProfilePage(),
      );
  const SetConsultantProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    PageController formController = PageController();
    final ValueNotifier<double> progress = ValueNotifier<double>(0);
    List<Widget> formPages = [
      LetsGetStarted(formController: formController),
      EnterYourName(formController: formController),
      AddAnID(formController: formController),
      StepThree(formController: formController),
      StepFour(formController: formController),
    ];
    return Scaffold(
      appBar: CustomAppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: ValueListenableBuilder<double>(
            valueListenable: progress,
            builder: (context, value, child) {
              return LinearProgressIndicator(
                minHeight: 5.0,
                value: value,
                color: colorScheme.secondary,
                backgroundColor: colorScheme.shadow,
              );
            },
          ),
        ),
      ),
      body: PageView(
        controller: formController,
        onPageChanged: (int page) {
          progress.value = page / formPages.length;
        },
        physics: const NeverScrollableScrollPhysics(),
        children: formPages,
      ),
    );
  }
}

class StepTwo extends StatelessWidget {
  final PageController formController;

  const StepTwo({super.key, required this.formController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Step Two'),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.sp),
        child: BottomButtons(
          onBackPressed: () => formController.previousPage(
            duration: const Duration(milliseconds: 5),
            curve: Curves.easeInOut,
          ),
          onContinuePressed: () => formController.nextPage(
            duration: const Duration(milliseconds: 5),
            curve: Curves.easeInOut,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class StepThree extends StatelessWidget {
  final PageController formController;

  const StepThree({super.key, required this.formController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Step Three'),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.sp),
        child: BottomButtons(
          onBackPressed: () => formController.previousPage(
            duration: const Duration(milliseconds: 5),
            curve: Curves.easeInOut,
          ),
          onContinuePressed: () => formController.nextPage(
            duration: const Duration(milliseconds: 5),
            curve: Curves.easeInOut,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class StepFour extends StatelessWidget {
  final PageController formController;

  const StepFour({super.key, required this.formController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Step Four'),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.sp),
        child: BottomButtons(
          onBackPressed: () => formController.previousPage(
            duration: const Duration(milliseconds: 5),
            curve: Curves.easeInOut,
          ),
          onContinuePressed: () => formController.nextPage(
            duration: const Duration(milliseconds: 5),
            curve: Curves.easeInOut,
          ),
          primaryButtonText: 'Done',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
