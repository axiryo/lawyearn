import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lawyearn/core/entities/profile.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_sign_up_usecase.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignUpUseCase _authSignUpUseCase;
  AuthBloc({required AuthSignUpUseCase authSignUpUseCase})
      : _authSignUpUseCase = authSignUpUseCase,
        super(AuthInitial()) {
    on<AuthSignUpWithEmailEvent>(authSignUpWithEmailEvent);
  }

  FutureOr<void> authSignUpWithEmailEvent(
      AuthSignUpWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthSignUpWithEmailLoading());
    var response = await _authSignUpUseCase(UserSignUpParameters(
        name: event.name, email: event.email, password: event.password));

    response.fold(
        (l) => emit(AuthSignUpWithEmailError(l.message)),
        (user) => emit(
              AuthSignUpWithEmailSuccess(profile: user),
            ));
  }
}

EventTransformer<T> debounce<T>(
    [Duration duration = const Duration(milliseconds: 500)]) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
