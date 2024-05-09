import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:lawyearn/core/common/widgets/heading_with_subtitle.dart';
import 'package:lawyearn/core/common/widgets/overlay_loader.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/core/utils/show_snackbar.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/custom_text_field.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/home/presentation/pages/homepage.dart';
import 'package:lawyearn/service_locator.dart';

class SignupPage extends StatefulWidget {
  static route(String email) => MaterialPageRoute(
        builder: (context) => SignupPage(email: email),
      );

  final String email;
  const SignupPage({super.key, required this.email});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showSnackBar(context, state.message);
        }
        if (state is AuthSuccess) {
          getIt<GlobalUserProvider>().setUserProfile(
              (context.read<AppUserCubit>().state as AppUserLoggedIn).profile);
          Navigator.pushAndRemoveUntil(
            context,
            Homepage.route(),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return OverlayLoader(
          isLoading: state is AuthLoading,
          child: Scaffold(
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeadingWithSubtitle(
                      heading: 'Create new account',
                      subtitle: 'Information provided below must be real.',
                    ),
                    Text(
                      'You will be creating an account for: ${widget.email}',
                      textAlign: TextAlign.left,
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
                    CustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      isObscureText: true,
                    ),
                    SizedBox(height: 8.h),
                    CustomPrimaryButton(
                        buttonText: 'Continue',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthSignUpWithEmailEvent(
                                    firstName: firstNameController.text.trim(),
                                    middleName:
                                        middleNameController.text.trim(),
                                    lastName: lastNameController.text.trim(),
                                    email: widget.email.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                            FocusScope.of(context).unfocus();
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
