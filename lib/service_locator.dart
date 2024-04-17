import 'package:get_it/get_it.dart';
import 'package:lawyearn/core/theme/bloc/theme_bloc.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ThemeBloc>(ThemeBloc());
  getIt.registerSingleton<AuthBloc>(AuthBloc());
}
