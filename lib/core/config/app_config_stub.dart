/// Non-web stub: returns empty strings on iOS/Android.
class AppConfig {
  AppConfig._();
  static String get supabaseUrl => '';
  static String get supabaseAnonKey => '';
  static String get appEnv => 'production';
  static bool get isConfigured => false;
}
