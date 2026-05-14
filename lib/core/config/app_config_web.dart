import 'dart:js_interop';

/// Web implementation: reads window._lumoConfig written by deploy/entrypoint.sh.
class AppConfig {
  AppConfig._();

  static String get supabaseUrl => _read('supabaseUrl');
  static String get supabaseAnonKey => _read('supabaseAnonKey');
  static String get appEnv => _read('appEnv');
  static bool get isConfigured =>
      supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;

  static String _read(String key) {
    try {
      final cfg = _lumoConfig;
      if (cfg == null) return '';
      final val = cfg.getProperty<JSString?>(key.toJS);
      return val?.toDart ?? '';
    } catch (_) {
      return '';
    }
  }
}

@JS('window._lumoConfig')
external JSObject? get _lumoConfig;
