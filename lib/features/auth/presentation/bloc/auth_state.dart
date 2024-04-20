part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthSignUpWithEmailSuccess extends AuthState {
  final Profile profile;

  const AuthSignUpWithEmailSuccess({required this.profile});
}

final class AuthSignUpWithEmailLoading extends AuthState {}

final class AuthSignUpWithEmailError extends AuthState {
  final String message;

  const AuthSignUpWithEmailError(this.message);
}
