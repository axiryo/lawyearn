import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String? middleName;
  final String lastName;
  final bool isEmailVerified;
  final String? avatarUrl;

  const Profile({
    required this.id,
    required this.email,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.isEmailVerified,
    this.avatarUrl,
  });

  @override
  List<Object> get props => [id, email, firstName, lastName, isEmailVerified];
}
