part of 'account_settings_bloc.dart';

sealed class AccountSettingsState extends Equatable {
  const AccountSettingsState();

  @override
  List<Object> get props => [];
}

final class AccountSettingsInitial extends AccountSettingsState {}

final class AccountSettingsSuccess extends AccountSettingsState {}

final class AccountSettingsLoading extends AccountSettingsState {}

final class AccountSettingsError extends AccountSettingsState {
  final String message;

  const AccountSettingsError({required this.message});
}

final class AccountSettingsLogout extends AccountSettingsState {}
