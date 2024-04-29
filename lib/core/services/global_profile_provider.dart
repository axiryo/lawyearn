import 'package:lawyearn/core/common/entities/profile.dart';

class GlobalUserProvider {
  static final GlobalUserProvider _instance = GlobalUserProvider._internal();
  Profile? _userProfile;

  factory GlobalUserProvider() {
    return _instance;
  }

  GlobalUserProvider._internal();

  void setUserProfile(Profile profile) {
    _userProfile = profile;
  }

  Profile? getUserProfile() {
    return _userProfile;
  }
}
