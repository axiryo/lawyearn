part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

final class EditProfileSave extends EditProfileEvent {
  final String firstName;
  final String? middleName;
  final String lastName;

  const EditProfileSave({
    required this.firstName,
    this.middleName,
    required this.lastName,
  });
}
