// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String? middleName;
  final String lastName;
  final bool isEmailVerified;

  const Profile({
    required this.id,
    required this.email,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.isEmailVerified,
  });

  @override
  List<Object> get props => [id, email, firstName, lastName, isEmailVerified];
}
