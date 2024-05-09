import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> continueWithEmail({
    required String email,
  });

  Future<Either<Failure, User>> loginWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
