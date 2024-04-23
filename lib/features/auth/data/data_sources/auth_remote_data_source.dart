import 'package:lawyearn/core/error/exception.dart';
import 'package:lawyearn/features/auth/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<ProfileModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<bool> continueWithEmail({
    required String email,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<ProfileModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        },
      );
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return ProfileModel.fromMap(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<bool> continueWithEmail({required String email}) async {
    try {
      final response =
          await supabaseClient.from('profiles').select().eq('email', email);
      if (response.isNotEmpty) {
        return true;
      }
      throw const ServerException('Email does not exist.');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
