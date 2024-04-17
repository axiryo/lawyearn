import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/core/theme/app_palette.dart';
import 'package:lawyearn/core/widgets/custom_gradient_button.dart';
import 'package:lawyearn/core/widgets/custom_text_field.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/auth/presentation/pages/signup_page.dart';
import 'package:lawyearn/service_locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48.h),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/lawyearn_logo.svg',
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor, BlendMode.srcIn),
                  ),
                ),
                SizedBox(height: 80.h),
                Text(
                  'Sign in.',
                  style: TextStyle(
                    fontSize: 40.sp,
                    height: 1.h,
                    wordSpacing: 0.8.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(hintText: 'Email', controller: emailController),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  isObscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 32.sp),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthNavigateToSignUp) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignUpPage()),
                (Route<dynamic> route) => false,
              );
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                  buttonText: 'Sign In',
                  onPressed: () {
                    log('Sign in clicked');
                  }),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  getIt<AuthBloc>().add(AuthNavigateToSignUpEvent());
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    children: const <TextSpan>[
                      TextSpan(text: 'Don\'t have an account yet? '),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppPallete.accentColor,
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
    );
  }
}
