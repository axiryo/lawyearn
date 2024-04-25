import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyearn/core/common/entities/profile.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(Profile? profile) {
    if (profile == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(profile));
    }
  }
}
