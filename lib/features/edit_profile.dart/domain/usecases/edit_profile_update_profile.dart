import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/edit_profile.dart/domain/repositories/edit_profile_repository.dart';

class EditProfileUpdateProfileUseCase
    implements UseCase<Profile, UpdateProfileParams> {
  final EditProfileRepository editProfileRepository;

  EditProfileUpdateProfileUseCase(this.editProfileRepository);

  @override
  Future<Either<Failure, Profile>> call(UpdateProfileParams params) async {
    return await editProfileRepository.updateProfile(
      firstName: params.firstName,
      middleName: params.middleName,
      lastName: params.lastName,
    );
  }
}

class UpdateProfileParams {
  final String firstName;
  final String? middleName;
  final String lastName;

  UpdateProfileParams(
      {required this.firstName, this.middleName, required this.lastName});
}
