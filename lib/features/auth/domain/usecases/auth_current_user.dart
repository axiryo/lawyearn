import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/auth/domain/repositories/auth_repository.dart';

class AuthCurrentUserUseCase implements UseCase<Profile, NoParams> {
  final AuthRepository authRepository;

  AuthCurrentUserUseCase(this.authRepository);
  @override
  Future<Either<Failure, Profile>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
