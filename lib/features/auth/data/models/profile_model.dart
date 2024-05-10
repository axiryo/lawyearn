import 'package:lawyearn/core/common/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.email,
    required super.firstName,
    super.middleName,
    required super.lastName,
    required super.isEmailVerified,
    super.avatarUrl,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      firstName: map['first_name'] ?? '',
      middleName: map['middle_name'] ?? '',
      lastName: map['last_name'] ?? '',
      isEmailVerified: map['isEmailVerified'] ?? false,
      avatarUrl: map['avatar_url'] ?? '',
    );
  }

  ProfileModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? middleName,
    String? lastName,
    bool? isEmailVerified,
    String? avatarUrl,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      middleName: middleName,
      lastName: lastName ?? this.lastName,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
