import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/custom_text_field.dart';
import 'package:lawyearn/core/common/widgets/heading_with_subtitle.dart';
import 'package:lawyearn/core/common/widgets/overlay_loader.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/features/edit_profile.dart/presentation/bloc/edit_profile_bloc.dart';
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
  bool isFirstNameChanged = false;
  bool isMiddleNameChanged = false;
  bool isLastNameChanged = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: profile!.firstName);
    middleNameController = TextEditingController(text: profile!.middleName);
    lastNameController = TextEditingController(text: profile!.lastName);
    isFirstNameChanged = profile!.firstName != firstNameController.text;
    isMiddleNameChanged = profile!.middleName != middleNameController.text;
    isLastNameChanged = profile!.lastName != lastNameController.text;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          getIt<GlobalUserProvider>().setUserProfile(state.profile);
        }
      },
      builder: (context, state) {
        return OverlayLoader(
          isLoading: state is EditProfileLoading,
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
                        SizedBox(height: 8.h),
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
                            if (formKey.currentState!.validate()
                                // &&
                                // (isFirstNameChanged ||
                                //     isMiddleNameChanged ||
                                //     isLastNameChanged ||
                                //     image != null)
                                ) {
                              context.read<EditProfileBloc>().add(
                                    EditProfileSave(
                                      firstName:
                                          firstNameController.text.trim(),
                                      middleName:
                                          middleNameController.text.trim(),
                                      lastName: lastNameController.text.trim(),
                                    ),
                                  );
                              FocusScope.of(context).unfocus();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
