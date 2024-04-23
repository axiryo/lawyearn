import 'package:lawyearn/core/common/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required super.id,
    required super.email,
    required super.name,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
