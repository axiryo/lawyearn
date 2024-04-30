import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/overlay_loader.dart';
import 'package:lawyearn/core/utils/show_snackbar.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/custom_text_field.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/home/presentation/pages/homepage.dart';

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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
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
                    Center(
                      child: Text(
                        'Create new account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26.sp,
                          height: 1.h,
                          wordSpacing: 0.8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    const Text(
                      'Information provided below must be real.',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'You will be creating an account for: ${widget.email}',
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: 'Name',
                      controller: nameController,
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
                                    name: nameController.text.trim(),
                                    email: widget.email.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
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
