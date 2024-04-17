part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthNavigateToSignInEvent extends AuthEvent {}

final class AuthNavigateToSignUpEvent extends AuthEvent {}
