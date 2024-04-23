import 'package:dartz/dartz.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/auth/domain/repository/auth_repository.dart';

class AuthSignUpUseCase implements UseCase<Profile, UserSignUpParameters> {
  final AuthRepository authRepository;
  const AuthSignUpUseCase(this.authRepository);

  @override
  Future<Either<Failure, Profile>> call(UserSignUpParameters params) async {
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
