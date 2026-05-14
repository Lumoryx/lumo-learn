/// Runtime config reader — reads from window._lumoConfig (injected by Docker
/// entrypoint) on web, returns empty strings on mobile.
export 'app_config_stub.dart'
    if (dart.library.js_interop) 'app_config_web.dart';
