import 'package:dartz/dartz.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/auth/domain/repository/auth_repository.dart';

class AuthContinueWithEmailUseCase implements UseCase<bool, String> {
  final AuthRepository authRepository;

  AuthContinueWithEmailUseCase(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await authRepository.continueWithEmail(email: params);
  }
}
