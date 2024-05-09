import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:lawyearn/core/common/widgets/custom_app_bar.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/custom_text_field.dart';
import 'package:lawyearn/core/common/widgets/heading_with_subtitle.dart';
import 'package:lawyearn/core/common/widgets/overlay_loader.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/core/utils/show_snackbar.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/home/presentation/pages/homepage.dart';
import 'package:lawyearn/service_locator.dart';

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
                      heading: 'Enter your password',
                    ),
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
                    CustomPrimaryButton(
                        buttonText: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLoginWithEmail(
                                      email: widget.email,
                                      password: passwordController.text.trim()),
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
