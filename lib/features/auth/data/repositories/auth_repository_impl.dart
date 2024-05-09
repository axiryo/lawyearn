import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/exception.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:lawyearn/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, Profile>> currentUser() async {
    try {
      final user = await authRemoteDataSource.getCurrentUserdata();
      if (user == null) {
        return left(Failure('User not logged in!'));
      }

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> signUpWithEmail(
      {required String firstName,
      String? middleName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmail(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        email: email,
        password: password,
      );
      return right(user);
    } on sb.AuthException catch (e) {
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
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final user = await authRemoteDataSource.loginWithEmail(
          email: email, password: password);

      return right(user);
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
