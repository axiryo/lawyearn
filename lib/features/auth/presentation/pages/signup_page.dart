import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawyearn/core/theme/app_palette.dart';
import 'package:lawyearn/core/widgets/custom_gradient_button.dart';
import 'package:lawyearn/core/widgets/custom_text_field.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/auth/presentation/pages/signin_page.dart';
import 'package:lawyearn/service_locator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  late TabController tabBarController;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    tabBarController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabBarController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                  'Sign up.',
                  style: TextStyle(
                    fontSize: 40.sp,
                    height: 1.h,
                    wordSpacing: 0.8.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(hintText: 'Name', controller: nameController),
                SizedBox(height: 8.h),
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
            if (state is AuthNavigateToSignIn) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignInPage()),
                (Route<dynamic> route) => false,
              );
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    log('Sign up clicked');
                  }),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  getIt<AuthBloc>().add(AuthNavigateToSignInEvent());
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    children: const <TextSpan>[
                      TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Sign in',
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
