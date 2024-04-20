import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/core/utils/show_snackbar.dart';
import 'package:lawyearn/core/widgets/custom_button.dart';
import 'package:lawyearn/core/widgets/custom_button_with_icon.dart';
import 'package:lawyearn/core/widgets/custom_text_field.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                    SvgPicture.asset(
                      'assets/images/lawyearn_alt.svg',
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor, BlendMode.srcIn),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Log in or sign up',
                      style: TextStyle(
                        fontSize: 26.sp,
                        height: 1.h,
                        wordSpacing: 0.8.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),
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
                    SizedBox(height: 8.h),
                    Text('or', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(height: 8.h),
                    CustomButtonWithIcon(
                      buttonText: 'Continue with Google',
                      onPressed: () {},
                      prefixIcon: SvgPicture.asset(
                          'assets/images/socials/google.svg',
                          height: 24.h),
                    ),
                    SizedBox(height: 8.h),
                    CustomButtonWithIcon(
                      buttonText: 'Continue with Apple',
                      onPressed: () {},
                      prefixIcon: SvgPicture.asset(
                          'assets/images/socials/apple.svg',
                          height: 24.h),
                    ),
                    SizedBox(height: 8.h),
                    CustomButtonWithIcon(
                      buttonText: 'Continue with Facebook',
                      onPressed: () {},
                      prefixIcon: SvgPicture.asset(
                          'assets/images/socials/facebook.svg',
                          height: 24.h),
                    ),
                    SizedBox(height: 24.h),
                    Text('Need help signing in?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).highlightColor)),
                    SizedBox(height: 24.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Rubik'),
                        children: <TextSpan>[
                          const TextSpan(
                              text:
                                  'By signing up, you are creating a Lawyearn account and agree to Lawyearn\'s '),
                          TextSpan(
                            text: 'Terms',
                            style: TextStyle(
                                color: Theme.of(context).highlightColor),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                color: Theme.of(context).highlightColor),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    )
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
