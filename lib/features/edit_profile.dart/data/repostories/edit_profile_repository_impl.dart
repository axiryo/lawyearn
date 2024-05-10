import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/exception.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/edit_profile.dart/data/data_sources/edit_profile_remote_data_source.dart';
import 'package:lawyearn/features/edit_profile.dart/domain/repositories/edit_profile_repository.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  final EditProfileDataSource editProfileDataSource;

  EditProfileRepositoryImpl(this.editProfileDataSource);
  @override
  Future<Either<Failure, Profile>> updateProfile({
    required String firstName,
    String? middleName,
    required String lastName,
  }) async {
    try {
      final user = await editProfileDataSource.updateProfile(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
