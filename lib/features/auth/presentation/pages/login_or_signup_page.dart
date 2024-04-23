import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/widgets/custom_loader.dart';
import 'package:lawyearn/core/common/widgets/custom_text_field.dart';
import 'package:lawyearn/core/utils/show_snackbar.dart';
import 'package:lawyearn/core/common/widgets/custom_button.dart';
import 'package:lawyearn/core/common/widgets/display_lawyearn_logo.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/auth/presentation/pages/signup_page.dart';
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
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
              if (state is AuthEmailNotExist) {
                Navigator.push(
                  context,
                  SignupPage.route(state.email),
                );
              }
              if (state is AuthEmailExist) {
                showSnackBar(context, 'Email exist, let\'s login');
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const CustomLoader();
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DisplayLawyearnLogo(),
                  const AuthLoginSignupMessage(),
                  CustomTextField(
                    hintText: 'Email',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 8.h),
                  CustomPrimaryButton(
                      buttonText: 'Continue with Email',
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthContinueWithEmail(
                            email: emailController.text.trim()));
                      }),
                  const AuthOrDivider(),
                  const AuthSocialButtons(),
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
