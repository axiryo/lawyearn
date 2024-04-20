import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/utils/show_snackbar.dart';
import 'package:lawyearn/core/widgets/custom_button.dart';
import 'package:lawyearn/core/widgets/display_lawyearn_logo.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/auth/presentation/pages/signup_page.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_login_signup_message.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_need_help_signin.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_or_divider.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_policy.dart';
import 'package:lawyearn/features/auth/presentation/widgets/auth_social_buttons.dart';

class LoginOrSignupPage extends StatelessWidget {
  const LoginOrSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                showSnackBar(context, state.message);
              }
              if (state is AuthNavigateToSignupSuccess) {
                Navigator.push(
                  context,
                  SignupPage.route(),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DisplayLawyearnLogo(),
                  const AuthLoginSignupMessage(),
                  const AuthSocialButtons(),
                  const AuthOrDivider(),
                  CustomPrimaryButton(
                      buttonText: 'Continue with Email',
                      onPressed: () {
                        log('Button pressed');
                        context.read<AuthBloc>().add(AuthNavigateToSignup());
                      }),
                  const AuthNeedHelpSignIn(),
                  const AuthPolicy(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
