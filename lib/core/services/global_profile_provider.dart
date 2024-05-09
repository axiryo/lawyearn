import 'package:supabase_flutter/supabase_flutter.dart';

class GlobalUserProvider {
  static final GlobalUserProvider _instance = GlobalUserProvider._internal();
  User? _userProfile;

  factory GlobalUserProvider() {
    return _instance;
  }

  GlobalUserProvider._internal();

  void setUserProfile(User profile) {
    _userProfile = profile;
  }

  User? getUserProfile() {
    return _userProfile;
  }

  void clearUserProfile() {
    _userProfile = null;
  }
}
