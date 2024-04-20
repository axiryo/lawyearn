import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/utils/show_snackbar.dart';
import 'package:lawyearn/core/widgets/custom_button.dart';
import 'package:lawyearn/core/widgets/custom_text_field.dart';
import 'package:lawyearn/core/widgets/display_lawyearn_logo.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_login_signup_message.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_need_help_signin.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_or_divider.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_policy.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_social_buttons.dart';

class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({super.key});

  @override
  State<LoginOrSignupPage> createState() => _LoginOrSignupPageState();
}

class _LoginOrSignupPageState extends State<LoginOrSignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSignUpWithEmailError) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is AuthSignUpWithEmailLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const DisplayLawyearnLogo(),
                    const AuthLoginSignupMessage(),
                    CustomTextField(
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
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
                            log('Button pressed');
                            context.read<AuthBloc>().add(
                                  AuthSignUpWithEmailEvent(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                        }),
                    const AuthOrDivider(),
                    const AuthSocialButtons(),
                    const AuthNeedHelpSignIn(),
                    const AuthPolicy(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
