part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthNavigateToSignIn extends AuthState {}

final class AuthNavigateToSignUp extends AuthState {}
