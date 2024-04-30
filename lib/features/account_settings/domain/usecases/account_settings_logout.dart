import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/account_settings/domain/repository/account_settings_repository.dart';

class AccountSettingsLogoutUsecase implements UseCase {
  final AccountSettingsRepository accountSettingsRepository;

  AccountSettingsLogoutUsecase(this.accountSettingsRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await accountSettingsRepository.logout();
  }
}
