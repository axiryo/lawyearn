import 'package:lawyearn/core/error/exception.dart';
import 'package:lawyearn/core/services/global_profile_provider.dart';
import 'package:lawyearn/service_locator.dart';
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
      getIt<GlobalUserProvider>().clearUserProfile();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
