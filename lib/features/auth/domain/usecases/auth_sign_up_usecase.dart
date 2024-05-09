import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSignUpUseCase implements UseCase<User, UserSignUpParameters> {
  final AuthRepository authRepository;
  const AuthSignUpUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParameters params) async {
    return await authRepository.signUpWithEmail(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParameters {
  final String name;
  final String email;
  final String password;

  UserSignUpParameters(
      {required this.name, required this.email, required this.password});
}
