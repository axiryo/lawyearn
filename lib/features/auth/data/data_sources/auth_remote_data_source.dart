import 'package:lawyearn/core/error/exception.dart';
import 'package:lawyearn/features/auth/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<ProfileModel> signUpWithEmail({
    required String firstName,
    String? middleName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<bool> continueWithEmail({
    required String email,
  });

  Future<ProfileModel> loginWithEmail({
    required String email,
    required String password,
  });

  Future<ProfileModel?> getCurrentUserdata();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<ProfileModel> signUpWithEmail(
      {required String firstName,
      String? middleName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'first_name': firstName,
          'middle_name': middleName,
          'last_name': lastName,
        },
      );
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return ProfileModel.fromMap(response.user!.toJson()).copyWith(
        firstName: currentUserSession!.user.userMetadata!['first_name'],
        middleName: currentUserSession!.user.userMetadata!['middle_name'],
        lastName: currentUserSession!.user.userMetadata!['last_name'],
        isEmailVerified: currentUserSession!.user.emailConfirmedAt!.isNotEmpty,
      );
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

  @override
  Future<ProfileModel> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return ProfileModel.fromMap(response.user!.toJson()).copyWith(
        firstName: currentUserSession!.user.userMetadata!['first_name'],
        middleName: currentUserSession!.user.userMetadata!['middle_name'],
        lastName: currentUserSession!.user.userMetadata!['last_name'],
        isEmailVerified: currentUserSession!.user.emailConfirmedAt!.isNotEmpty,
        avatarUrl: currentUserSession!.user.userMetadata!['avatar_url'],
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ProfileModel?> getCurrentUserdata() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);
        return ProfileModel.fromMap(userData.first);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
