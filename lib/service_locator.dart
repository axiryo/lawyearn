import 'package:get_it/get_it.dart';
import 'package:lawyearn/core/secrets/app_secrets.dart';
import 'package:lawyearn/core/theme/bloc/theme_bloc.dart';
import 'package:lawyearn/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:lawyearn/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:lawyearn/features/auth/domain/repository/auth_repository.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_sign_up_usecase.dart';
import 'package:lawyearn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  final supabase = await Supabase.initialize(
    anonKey: AppSecrets.supabaseAnonKey,
    url: AppSecrets.supabaseUrl,
  );

  getIt.registerLazySingleton(() => supabase.client);
  _initAuth();
  _initTheme();
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
    ..registerLazySingleton(
      () => AuthBloc(
        authSignUpUseCase: getIt(),
      ),
    );
}

void _initTheme() {
  getIt.registerLazySingleton(() => ThemeBloc());
}
