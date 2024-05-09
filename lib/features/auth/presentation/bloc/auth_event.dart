part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignUpWithEmailEvent extends AuthEvent {
  final String firstName;
  final String? middleName;
  final String lastName;
  final String email;
  final String password;

  const AuthSignUpWithEmailEvent({
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}

final class AuthContinueWithEmail extends AuthEvent {
  final String email;

  const AuthContinueWithEmail({required this.email});
}

final class AuthLoginWithEmail extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginWithEmail({required this.email, required this.password});
}

final class AuthIsUserLoggedIn extends AuthEvent {
  const AuthIsUserLoggedIn();
}
