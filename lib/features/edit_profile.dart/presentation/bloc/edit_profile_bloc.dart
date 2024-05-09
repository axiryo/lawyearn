import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/features/edit_profile.dart/domain/usecases/edit_profile_update_profile.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileUpdateProfileUseCase _editProfileUpdateProfileUseCase;
  EditProfileBloc({
    required EditProfileUpdateProfileUseCase editProfileUpdateProfileUseCase,
  })  : _editProfileUpdateProfileUseCase = editProfileUpdateProfileUseCase,
        super(EditProfileInitial()) {
    on<EditProfileEvent>((_, emit) => emit(EditProfileLoading()));
    on<EditProfileSave>(editProfileSave);
  }

  FutureOr<void> editProfileSave(
      EditProfileSave event, Emitter<EditProfileState> emit) async {
    var response = await _editProfileUpdateProfileUseCase(UpdateProfileParams(
      firstName: event.firstName,
      middleName: event.middleName,
      lastName: event.lastName,
    ));

    response.fold(
      (l) => emit(EditProfileError(l.message)),
      (profile) => emit(EditProfileSuccess(profile: profile)),
    );
  }
}
