import 'package:lawyearn/core/common/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.email,
    required super.name,
    required super.isEmailVerified,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      isEmailVerified: map['isEmailVerified'] ?? false,
    );
  }

  ProfileModel copyWith({
    String? id,
    String? email,
    String? name,
    bool? isEmailVerified,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
