import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/auth/domain/repositories/auth_repository.dart';

class AuthLoginWithEmailUseCase implements UseCase<Profile, UserLoginParams> {
  final AuthRepository authRepository;

  AuthLoginWithEmailUseCase(this.authRepository);
  @override
  Future<Either<Failure, Profile>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmail(
        email: params.email, password: params.password);
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
