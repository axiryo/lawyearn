part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUpWithEmailEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthSignUpWithEmailEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
