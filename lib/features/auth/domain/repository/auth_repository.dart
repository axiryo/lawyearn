import 'package:dartz/dartz.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/auth/data/models/profile_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, ProfileModel>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });
}