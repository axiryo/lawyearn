import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/custom_loader.dart';
import 'package:lawyearn/core/common/widgets/custom_text_field.dart';
import 'package:lawyearn/core/utils/show_snackbar.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  static route(String email) => MaterialPageRoute(
        builder: (context) => LoginPage(email: email),
      );

  final String email;
  const LoginPage({super.key, required this.email});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              showSnackBar(context, state.message);
            }
            if (state is AuthLoginWithEmailSuccess) {
              showSnackBar(context, state.profile.id);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CustomLoader();
            }

            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Create a password',
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
                  CustomTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is missing!';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Minimum of 6 characters',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(height: 16.h),
                  CustomPrimaryButton(
                      buttonText: 'Create account',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthLoginWithEmail(
                                    email: widget.email,
                                    password: passwordController.text.trim()),
                              );
                        }
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
