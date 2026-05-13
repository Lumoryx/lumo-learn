#!/bin/sh
# Injects runtime environment variables into config.js before Nginx starts.
# Flutter reads window._lumoConfig at startup instead of baked-in dart-defines.
set -e

cat > /usr/share/nginx/html/config.js <<EOF
window._lumoConfig = {
  supabaseUrl: "${SUPABASE_URL:-}",
  supabaseAnonKey: "${SUPABASE_ANON_KEY:-}",
  appEnv: "${APP_ENV:-production}"
};
EOF

echo "[entrypoint] config.js written (SUPABASE_URL=${SUPABASE_URL:-<not set>})"

exec nginx -g "daemon off;"
