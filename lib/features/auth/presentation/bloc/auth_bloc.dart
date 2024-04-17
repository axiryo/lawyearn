import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthNavigateToSignInEvent>(authNavigateToSignInEvent);
    on<AuthNavigateToSignUpEvent>(authNavigateToSignUpEvent);
  }

  FutureOr<void> authNavigateToSignInEvent(
      AuthNavigateToSignInEvent event, Emitter<AuthState> emit) {
    emit(AuthNavigateToSignIn());
  }

  FutureOr<void> authNavigateToSignUpEvent(
      AuthNavigateToSignUpEvent event, Emitter<AuthState> emit) {
    emit(AuthNavigateToSignUp());
  }
}

EventTransformer<T> debounce<T>(
    [Duration duration = const Duration(milliseconds: 500)]) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
