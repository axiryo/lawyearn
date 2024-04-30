import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/error/exception.dart';

import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/account_settings/data/data_sources/account_settings_remote_data_source.dart';
import 'package:lawyearn/features/account_settings/domain/repository/account_settings_repository.dart';

class AccountSettingsRepositoryImpl implements AccountSettingsRepository {
  final AccountSettingsDataSource accountSettingsDataSource;
  AccountSettingsRepositoryImpl(this.accountSettingsDataSource);
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await accountSettingsDataSource.logout();
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
