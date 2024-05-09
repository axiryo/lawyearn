// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

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
      firstName: params.firstName,
      middleName: params.middleName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParameters {
  final String firstName;
  final String? middleName;
  final String lastName;
  final String email;
  final String password;
  UserSignUpParameters({
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
