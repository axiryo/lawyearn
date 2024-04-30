import 'package:lawyearn/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AccountSettingsDataSource {
  Future<void> logout();
}

class AccountSettingsDataSourceImpl implements AccountSettingsDataSource {
  final SupabaseClient supabaseClient;

  AccountSettingsDataSourceImpl(this.supabaseClient);
  @override
  Future<void> logout() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
