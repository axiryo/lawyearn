import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/error/failure.dart';

abstract interface class AccountSettingsRepository {
  Future<Either<Failure, void>> logout();
}
