import 'package:lawyearn/core/common/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.email,
    required super.firstName,
    super.middleName,
    required super.lastName,
    required super.isEmailVerified,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      isEmailVerified: map['isEmailVerified'] ?? false,
    );
  }

  ProfileModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? middleName,
    String? lastName,
    bool? isEmailVerified,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      middleName: middleName,
      lastName: lastName ?? this.lastName,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
