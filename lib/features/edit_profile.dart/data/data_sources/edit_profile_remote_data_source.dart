import 'package:lawyearn/core/error/exception.dart';
import 'package:lawyearn/features/auth/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class EditProfileDataSource {
  Future<ProfileModel> updateProfile({
    required String firstName,
    String? middleName,
    required String lastName,
  });
}

class EditProfileDataSourceImpl implements EditProfileDataSource {
  final SupabaseClient supabaseClient;
  EditProfileDataSourceImpl(this.supabaseClient);

  @override
  Future<ProfileModel> updateProfile({
    required String firstName,
    String? middleName,
    required String lastName,
  }) async {
    try {
      final response = await supabaseClient.from('profiles').update({
        'first_name': firstName,
        'middle_name': middleName,
        'last_name': lastName,
      }).match({
        'id': supabaseClient.auth.currentUser!.id,
      }).select();

      return ProfileModel.fromMap(response.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
