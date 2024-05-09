import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Profile>> signUpWithEmail({
    required String firstName,
    String? middleName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> continueWithEmail({
    required String email,
  });

  Future<Either<Failure, Profile>> loginWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, Profile>> currentUser();
}
