import 'package:get_it/get_it.dart';
import 'package:lawyearn/core/common/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:lawyearn/core/secrets/app_secrets.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/core/theme/bloc/theme_bloc.dart';
import 'package:lawyearn/features/account_settings/data/data_sources/account_settings_remote_data_source.dart';
import 'package:lawyearn/features/account_settings/data/repositories/account_settings_repository_impl.dart';
import 'package:lawyearn/features/account_settings/domain/repository/account_settings_repository.dart';
import 'package:lawyearn/features/account_settings/domain/usecases/account_settings_logout.dart';
import 'package:lawyearn/features/account_settings/presentation/bloc/account_settings_bloc.dart';
import 'package:lawyearn/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:lawyearn/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:lawyearn/features/auth/domain/repository/auth_repository.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_continue_with_email.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_current_user.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_login_with_email.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_sign_up_usecase.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lawyearn/features/home/presentation/bloc/home_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  final supabase = await Supabase.initialize(
    anonKey: AppSecrets.supabaseAnonKey,
    url: AppSecrets.supabaseUrl,
  );

  getIt.registerLazySingleton(() => supabase.client);
  getIt.registerLazySingleton(() => AppUserCubit());
  getIt.registerLazySingleton(() => HomeBloc());
  getIt.registerLazySingleton<GlobalUserProvider>(() => GlobalUserProvider());
  _initAuth();
  _initTheme();
  _initAccountSettings();
}

void _initAuth() {
  getIt
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        getIt(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        getIt(),
      ),
    )
    ..registerFactory(
      () => AuthSignUpUseCase(
        getIt(),
      ),
    )
    ..registerFactory(
      () => AuthContinueWithEmailUseCase(
        getIt(),
      ),
    )
    ..registerFactory(
      () => AuthLoginWithEmailUseCase(
        getIt(),
      ),
    )
    ..registerFactory(
      () => AuthCurrentUserUseCase(
        getIt(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        authSignUpUseCase: getIt(),
        authContinueWithEmailUseCase: getIt(),
        authLoginWithEmailUseCase: getIt(),
        authCurrentUserUseCase: getIt(),
        appUserCubit: getIt(),
      ),
    );
}

void _initAccountSettings() {
  getIt
    ..registerFactory<AccountSettingsDataSource>(
      () => AccountSettingsDataSourceImpl(
        getIt(),
      ),
    )
    ..registerFactory<AccountSettingsRepository>(
      () => AccountSettingsRepositoryImpl(
        getIt(),
      ),
    )
    ..registerFactory(
      () => AccountSettingsLogoutUsecase(
        getIt(),
      ),
    )
    ..registerLazySingleton(
      () => AccountSettingsBloc(
        accountSettingsLogoutUsecase: getIt(),
      ),
    );
}

void _initTheme() {
  getIt.registerLazySingleton(() => ThemeBloc());
}
