import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyearn/core/entities/profile.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignUpUseCase _authSignUpUseCase;
  AuthBloc({required AuthSignUpUseCase authSignUpUseCase})
      : _authSignUpUseCase = authSignUpUseCase,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUpWithEmailEvent>(authSignUpWithEmailEvent);
    on<AuthNavigateToSignup>(authNavigateToSignUp);
  }

  FutureOr<void> authSignUpWithEmailEvent(
      AuthSignUpWithEmailEvent event, Emitter<AuthState> emit) async {
    var response = await _authSignUpUseCase(UserSignUpParameters(
        name: event.name, email: event.email, password: event.password));

    response.fold(
        (l) => emit(AuthError(l.message)),
        (user) => emit(
              AuthSignUpWithEmailSuccess(profile: user),
            ));
  }

  FutureOr<void> authNavigateToSignUp(
      AuthNavigateToSignup event, Emitter<AuthState> emit) {
    emit(AuthNavigateToSignupSuccess());
  }
}
