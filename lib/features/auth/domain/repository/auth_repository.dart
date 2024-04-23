import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/auth/data/models/profile_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, ProfileModel>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> continueWithEmail({
    required String email,
  });

  Future<Either<Failure, ProfileModel>> loginWithEmail({
    required String email,
    required String password,
  });
}
