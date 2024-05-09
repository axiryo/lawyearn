import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/common/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/core/theme/bloc/theme_bloc.dart';
import 'package:lawyearn/core/theme/bloc/theme_state.dart';
import 'package:lawyearn/features/account_settings/presentation/bloc/account_settings_bloc.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/auth/presentation/pages/login_or_signup_page.dart';
import 'package:lawyearn/features/edit_profile.dart/presentation/bloc/edit_profile_bloc.dart';
import 'package:lawyearn/features/home/presentation/bloc/home_bloc.dart';
import 'package:lawyearn/features/home/presentation/pages/homepage.dart';
import 'package:lawyearn/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<AppUserCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<ThemeBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt<AuthBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt<HomeBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt<AccountSettingsBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt<EditProfileBloc>(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Lawyearn',
              theme: state.themeData,
              home: BlocSelector<AppUserCubit, AppUserState, bool>(
                selector: (state) {
                  return state is AppUserLoggedIn;
                },
                builder: (context, isLoggedIn) {
                  if (isLoggedIn) {
                    getIt<GlobalUserProvider>().setUserProfile(
                        (context.read<AppUserCubit>().state as AppUserLoggedIn)
                            .profile);
                    return const Homepage();
                  }
                  return const LoginOrSignupPage();
                },
              ),
            );
          },
        );
      },
    );
  }
}

// Scaffold(
//                   body: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Switch(
//                           value: getIt<ThemeBloc>().state.isDarkTheme,
//                           onChanged: (value) {
//                             if (value) {
//                               getIt<ThemeBloc>().add(ThemeEvent.toggleDark);
//                             } else {
//                               getIt<ThemeBloc>().add(ThemeEvent.toggleLight);
//                             }
//                           },
//                         ),
//                         Text(state.isDarkTheme ? 'Dark' : 'Light')
//                       ],
//                     ),
//                   ),
//                 ),