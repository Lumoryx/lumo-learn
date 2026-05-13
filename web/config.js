// Default config for local `flutter run` development.
// In Docker, deploy/entrypoint.sh overwrites this file at container start.
// In production, set SUPABASE_URL and SUPABASE_ANON_KEY env vars.
window._lumoConfig = {
  supabaseUrl: "",
  supabaseAnonKey: "",
  appEnv: "development"
};
