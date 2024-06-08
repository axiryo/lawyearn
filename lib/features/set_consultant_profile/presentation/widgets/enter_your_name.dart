import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/custom_text_field.dart';
import 'package:lawyearn/core/common/widgets/rubik_text.dart';
import 'package:lawyearn/features/set_consultant_profile/presentation/widgets/bottom_buttons.dart';

class EnterYourName extends StatefulWidget {
  final PageController formController;

  const EnterYourName({super.key, required this.formController});

  @override
  _EnterYourNameState createState() => _EnterYourNameState();
}

class _EnterYourNameState extends State<EnterYourName>
    with AutomaticKeepAliveClientMixin<EnterYourName> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController aliasController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    aliasController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                text: 'Name as in ID',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
              const RubikText(
                text: 'Enter your name as in your identification document',
                style: TextStyle(
                  color: Color.fromARGB(255, 128, 127, 127),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.sp),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      hintText: 'First name',
                      hints: 'e.g., Samuel, not "Sam"',
                      controller: firstNameController,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: 'Middle name',
                      controller: middleNameController,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: 'Last name',
                      controller: lastNameController,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: 'Alias',
                      controller: aliasController,
                      hints: 'Optional',
                      isOptional: true,
                    ),
                    SizedBox(height: 64.sp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.sp),
        child: BottomButtons(
          onBackPressed: () => widget.formController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          onContinuePressed: () {
            if (formKey.currentState!.validate()) {
              widget.formController.nextPage(
                duration: const Duration(milliseconds: 5),
                curve: Curves.easeInOut,
              );
              FocusScope.of(context).unfocus();
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
