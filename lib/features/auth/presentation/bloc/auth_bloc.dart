import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_continue_with_email.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignUpUseCase _authSignUpUseCase;
  final AuthContinueWithEmailUseCase _authContinueWithEmailUseCase;
  AuthBloc({
    required AuthSignUpUseCase authSignUpUseCase,
    required AuthContinueWithEmailUseCase authContinueWithEmailUseCase,
  })  : _authSignUpUseCase = authSignUpUseCase,
        _authContinueWithEmailUseCase = authContinueWithEmailUseCase,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUpWithEmailEvent>(authSignUpWithEmailEvent);
    on<AuthContinueWithEmail>(authContinueWithEmail);
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

  FutureOr<void> authContinueWithEmail(
      AuthContinueWithEmail event, Emitter<AuthState> emit) async {
    var response = await _authContinueWithEmailUseCase(event.email);

    response.fold(
      (l) => emit(AuthEmailNotExist(event.email)),
      (r) => emit(AuthEmailExist()),
    );
  }
}
