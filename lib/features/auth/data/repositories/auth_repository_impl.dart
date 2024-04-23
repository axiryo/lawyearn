import 'package:dartz/dartz.dart';
import 'package:lawyearn/core/error/exception.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:lawyearn/features/auth/data/models/profile_model.dart';
import 'package:lawyearn/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, ProfileModel>> signUpWithEmail(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmail(
          name: name, email: email, password: password);
      return right(user);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> continueWithEmail(
      {required String email}) async {
    try {
      final isEmailExist =
          await authRemoteDataSource.continueWithEmail(email: email);
      return right(isEmailExist);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
