import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyearn/core/common/cubits/app_user_cubit/app_user_cubit.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_continue_with_email.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_current_user.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_login_with_email.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_sign_up_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignUpUseCase _authSignUpUseCase;
  final AuthContinueWithEmailUseCase _authContinueWithEmailUseCase;
  final AuthLoginWithEmailUseCase _authLoginWithEmailUseCase;
  final AuthCurrentUserUseCase _authCurrentUserUseCase;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required AuthSignUpUseCase authSignUpUseCase,
    required AuthContinueWithEmailUseCase authContinueWithEmailUseCase,
    required AuthLoginWithEmailUseCase authLoginWithEmailUseCase,
    required AuthCurrentUserUseCase authCurrentUserUseCase,
    required AppUserCubit appUserCubit,
  })  : _authSignUpUseCase = authSignUpUseCase,
        _authContinueWithEmailUseCase = authContinueWithEmailUseCase,
        _authLoginWithEmailUseCase = authLoginWithEmailUseCase,
        _authCurrentUserUseCase = authCurrentUserUseCase,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUpWithEmailEvent>(authSignUpWithEmailEvent);
    on<AuthContinueWithEmail>(authContinueWithEmail);
    on<AuthLoginWithEmail>(authLoginWithEmail);
    on<AuthIsUserLoggedIn>(authIsUserLoggedIn);
  }

  FutureOr<void> authSignUpWithEmailEvent(
      AuthSignUpWithEmailEvent event, Emitter<AuthState> emit) async {
    var response = await _authSignUpUseCase(UserSignUpParameters(
        name: event.name, email: event.email, password: event.password));

    response.fold(
      (l) => emit(AuthError(l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  FutureOr<void> authContinueWithEmail(
      AuthContinueWithEmail event, Emitter<AuthState> emit) async {
    var response = await _authContinueWithEmailUseCase(event.email);

    response.fold(
      (l) => emit(AuthEmailNotExist(event.email)),
      (r) => emit(AuthEmailExist(event.email)),
    );
  }

  FutureOr<void> authLoginWithEmail(
      AuthLoginWithEmail event, Emitter<AuthState> emit) async {
    var response = await _authLoginWithEmailUseCase(
        UserLoginParams(email: event.email, password: event.password));

    response.fold(
      (l) => emit(AuthError(l.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  FutureOr<void> authIsUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    var response = await _authCurrentUserUseCase(NoParams());

    response.fold(
      (l) => emit(AuthError(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _emitAuthSuccess(User profile, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(profile);
    emit(AuthSuccess(profile: profile));
  }
}
