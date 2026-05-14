import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: when Supabase credentials are configured, initialize here:
  // if (AppConfig.isConfigured) {
  //   await Supabase.initialize(
  //     url: AppConfig.supabaseUrl,
  //     anonKey: AppConfig.supabaseAnonKey,
  //   );
  //   await Firebase.initializeApp(...);
  // }

  runApp(const ProviderScope(child: LumoApp()));
}
