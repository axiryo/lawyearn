import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/theme/bloc/theme_bloc.dart';
import 'package:lawyearn/core/theme/bloc/theme_state.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/auth/presentation/pages/login_or_signup_page.dart';
import 'package:lawyearn/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            builder: (context, child) {
              return SafeArea(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Lawyearn',
                  theme: state.themeData,
                  home: const LoginOrSignupPage(),
                ),
              );
            },
          );
        },
      ),
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