part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}

final class AuthSignUpWithEmailSuccess extends AuthState {
  final Profile profile;

  const AuthSignUpWithEmailSuccess({required this.profile});
}

final class AuthEmailExist extends AuthState {
  final String email;

  const AuthEmailExist(this.email);
}

final class AuthEmailNotExist extends AuthState {
  final String email;

  const AuthEmailNotExist(this.email);
}

final class AuthLoginWithEmailSuccess extends AuthState {
  final Profile profile;

  const AuthLoginWithEmailSuccess({required this.profile});
}
