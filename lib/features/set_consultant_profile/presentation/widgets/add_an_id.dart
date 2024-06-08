import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/rubik_text.dart';
import 'package:lawyearn/features/set_consultant_profile/presentation/widgets/bottom_buttons.dart';

class AddAnID extends StatelessWidget {
  final PageController formController;

  const AddAnID({super.key, required this.formController});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              RubikText(
                text: 'Upload your ID',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
              const RubikText(
                text:
                    'Please upload a clear photo of your ID for verification.',
                style: TextStyle(
                  color: Color.fromARGB(255, 128, 127, 127),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.sp),
              DottedBorder(
                color: colorScheme.shadow,
                dashPattern: const [10, 4],
                radius: Radius.circular(12.sp),
                borderType: BorderType.RRect,
                strokeCap: StrokeCap.round,
                strokeWidth: 2,
                child: const SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open,
                        size: 40,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Select your image',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
