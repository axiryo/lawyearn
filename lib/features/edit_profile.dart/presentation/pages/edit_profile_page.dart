import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/custom_text_field.dart';
import 'package:lawyearn/core/common/widgets/heading_with_subtitle.dart';
import 'package:lawyearn/core/common/widgets/overlay_loader.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/service_locator.dart';

class EditProfilePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const EditProfilePage(),
      );
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Profile? profile = getIt<GlobalUserProvider>().getUserProfile();
  late TextEditingController firstNameController;
  late TextEditingController middleNameController;
  late TextEditingController lastNameController;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    firstNameController = TextEditingController(text: profile!.firstName);
    middleNameController = TextEditingController(text: profile!.middleName);
    lastNameController = TextEditingController(text: profile!.lastName);
    return OverlayLoader(
      isLoading: false,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeadingWithSubtitle(
                      heading: 'Edit Personal Information',
                      subtitle: 'Information provided below must be real.',
                    ),
                    CustomTextField(
                      hintText: 'First name',
                      controller: firstNameController,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: 'Middle name',
                      controller: middleNameController,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.length < 2) {
                            return 'Middle name must be at least 2 characters long.';
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: 'Last name',
                      controller: lastNameController,
                    ),
                    SizedBox(height: 8.h),
                    CustomPrimaryButton(
                        buttonText: 'Save',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // context.read<AuthBloc>().add(
                            //       AuthSignUpWithEmailEvent(
                            //         firstName: firstNameController.text.trim(),
                            //         middleName:
                            //             middleNameController.text.trim(),
                            //         lastName: lastNameController.text.trim(),
                            //         email: widget.email.trim(),
                            //         password: passwordController.text.trim(),
                            //       ),
                            //     );
                            FocusScope.of(context).unfocus();
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
