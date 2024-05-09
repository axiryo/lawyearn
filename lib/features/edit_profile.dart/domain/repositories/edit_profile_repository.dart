import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';

abstract interface class EditProfileRepository {
  Future<Either<Failure, Profile>> updateProfile({
    required String firstName,
    String? middleName,
    required String lastName,
  });
}
