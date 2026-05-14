#!/bin/sh
# Runs at container start.
# 1. Substitutes PORT into nginx config (Railway injects PORT, default 80).
# 2. Writes runtime config.js with Supabase credentials.
# 3. Starts Nginx.
set -e

PORT="${PORT:-80}"

# Substitute PORT placeholder in nginx config
sed -i "s/__PORT__/${PORT}/g" /etc/nginx/conf.d/default.conf

# Inject runtime config for the Flutter app
cat > /usr/share/nginx/html/config.js <<EOF
window._lumoConfig = {
  supabaseUrl: "${SUPABASE_URL:-}",
  supabaseAnonKey: "${SUPABASE_ANON_KEY:-}",
  appEnv: "${APP_ENV:-production}"
};
EOF

echo "[entrypoint] Listening on PORT=${PORT}"
echo "[entrypoint] SUPABASE_URL=${SUPABASE_URL:-<not set>}"

exec nginx -g "daemon off;"
