import 'package:lawyearn/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<User> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<bool> continueWithEmail({
    required String email,
  });

  Future<User> loginWithEmail({
    required String email,
    required String password,
  });

  Future<User?> getCurrentUserdata();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<User> signUpWithEmail({
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
      return User.fromJson(response.user!.toJson())!;
      // return ProfileModel.fromMap(response.user!.toJson()).copyWith(
      //   name: currentUserSession!.user.userMetadata!['name'],
      //   isEmailVerified: currentUserSession!.user.emailConfirmedAt!.isNotEmpty,
      // );
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
  Future<User> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return User.fromJson(response.user!.toJson())!;
      // return ProfileModel.fromMap(response.user!.toJson()).copyWith(
      //   name: currentUserSession!.user.userMetadata!['name'],
      //   isEmailVerified: currentUserSession!.user.emailConfirmedAt!.isNotEmpty,
      // );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User?> getCurrentUserdata() async {
    try {
      if (currentUserSession != null) {
        // final userData = await supabaseClient
        //     .from('profiles')
        //     .select()
        //     .eq('id', currentUserSession!.user.id);
        // return ProfileModel.fromMap(userData.first);
        return User.fromJson(currentUserSession!.user.toJson());
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
