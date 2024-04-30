import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/account_settings/domain/usecases/account_settings_logout.dart';

part 'account_settings_event.dart';
part 'account_settings_state.dart';

class AccountSettingsBloc
    extends Bloc<AccountSettingsEvent, AccountSettingsState> {
  final AccountSettingsLogoutUsecase _accountSettingsLogoutUsecase;
  AccountSettingsBloc({
    required AccountSettingsLogoutUsecase accountSettingsLogoutUsecase,
  })  : _accountSettingsLogoutUsecase = accountSettingsLogoutUsecase,
        super(AccountSettingsInitial()) {
    on<AccountSettingsEvent>((_, emit) => emit(AccountSettingsLoading()));
    on<AccountLogout>(accountLogout);
  }

  FutureOr<void> accountLogout(
      AccountLogout event, Emitter<AccountSettingsState> emit) async {
    var response = await _accountSettingsLogoutUsecase.call(NoParams());

    response.fold(
      (l) => emit(AccountSettingsError(message: l.message)),
      (r) => emit(AccountSettingsLogout()),
    );
  }
}
