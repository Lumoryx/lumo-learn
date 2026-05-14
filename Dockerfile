# ─────────────────────────────────────────────────────────────────────────────
# Stage 1: Build Flutter web
# ─────────────────────────────────────────────────────────────────────────────
FROM ghcr.io/cirruslabs/flutter:3.22.3 AS builder

WORKDIR /app

# Copy dependency manifests first for layer caching
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

# Copy full source
COPY . .

# Generate Freezed / Riverpod / json_serializable code
RUN flutter pub run build_runner build --delete-conflicting-outputs

# Build Flutter web (base-href / = served at root, not a sub-path)
RUN flutter build web --release --base-href /

# ─────────────────────────────────────────────────────────────────────────────
# Stage 2: Serve with Nginx
# ─────────────────────────────────────────────────────────────────────────────
FROM nginx:1.27-alpine

# Copy built web app
COPY --from=builder /app/build/web /usr/share/nginx/html

# Copy Nginx config and entrypoint
COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY deploy/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

# entrypoint.sh writes runtime config.js then starts Nginx
ENTRYPOINT ["/entrypoint.sh"]
