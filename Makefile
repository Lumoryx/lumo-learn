# ═══════════════════════════════════════════════════════════════════════════════
# Lumo Learn — Developer Makefile
# Usage: make <target>   Run `make help` to see all available commands.
# ═══════════════════════════════════════════════════════════════════════════════

# ── Config ────────────────────────────────────────────────────────────────────
FLUTTER        := flutter
DART           := dart
SUPABASE       := supabase
EDGE_FN        := generate-daily-content
BUILD_RUNNER   := $(FLUTTER) pub run build_runner

# Terminal colors
BOLD   := \033[1m
GREEN  := \033[0;32m
CYAN   := \033[0;36m
YELLOW := \033[0;33m
RED    := \033[0;31m
RESET  := \033[0m

.DEFAULT_GOAL := help
.PHONY: help setup env gen clean \
        run run-web run-ios run-android run-macos \
        test test-coverage lint format check \
        build-web build-ios build-android \
        supa-start supa-stop supa-reset supa-status supa-fn \
        deploy-fn changelog

# ── Help ──────────────────────────────────────────────────────────────────────
help:
	@echo ""
	@echo "$(BOLD)Lumo Learn — Developer Commands$(RESET)"
	@echo "────────────────────────────────────────────────────────"
	@echo ""
	@echo "$(CYAN)$(BOLD)SETUP$(RESET)"
	@echo "  $(GREEN)make setup$(RESET)          First-time: install deps, generate code, copy .env"
	@echo "  $(GREEN)make env$(RESET)            Copy .env.example → .env (edit values after)"
	@echo "  $(GREEN)make gen$(RESET)            Run build_runner (Freezed / Riverpod codegen)"
	@echo "  $(GREEN)make clean$(RESET)          Delete build artifacts and generated files"
	@echo ""
	@echo "$(CYAN)$(BOLD)RUN (Development)$(RESET)"
	@echo "  $(GREEN)make run$(RESET)            Run on Chrome (Web) — default"
	@echo "  $(GREEN)make run-web$(RESET)        Run on Chrome (Web)"
	@echo "  $(GREEN)make run-ios$(RESET)        Run on first available iOS simulator"
	@echo "  $(GREEN)make run-android$(RESET)    Run on first available Android emulator"
	@echo "  $(GREEN)make run-macos$(RESET)      Run as macOS desktop app"
	@echo ""
	@echo "$(CYAN)$(BOLD)QUALITY$(RESET)"
	@echo "  $(GREEN)make lint$(RESET)           flutter analyze (treat infos as errors)"
	@echo "  $(GREEN)make format$(RESET)         dart format . (auto-fix in place)"
	@echo "  $(GREEN)make check$(RESET)          lint + format check (CI-equivalent, no auto-fix)"
	@echo "  $(GREEN)make test$(RESET)           flutter test"
	@echo "  $(GREEN)make test-coverage$(RESET)  flutter test --coverage + open HTML report"
	@echo ""
	@echo "$(CYAN)$(BOLD)BUILD$(RESET)"
	@echo "  $(GREEN)make build-web$(RESET)      flutter build web --release"
	@echo "  $(GREEN)make build-ios$(RESET)      flutter build ipa --release"
	@echo "  $(GREEN)make build-android$(RESET)  flutter build appbundle --release"
	@echo ""
	@echo "$(CYAN)$(BOLD)SUPABASE (Local)$(RESET)"
	@echo "  $(GREEN)make supa-start$(RESET)     Start local Supabase stack (DB + Auth + Storage)"
	@echo "  $(GREEN)make supa-stop$(RESET)      Stop local Supabase stack"
	@echo "  $(GREEN)make supa-reset$(RESET)     Reset DB and re-run all migrations"
	@echo "  $(GREEN)make supa-status$(RESET)    Show running services + local URLs"
	@echo "  $(GREEN)make supa-fn$(RESET)        Serve Edge Function locally (hot-reload)"
	@echo ""
	@echo "$(CYAN)$(BOLD)RELEASE$(RESET)"
	@echo "  $(GREEN)make deploy-fn$(RESET)      Deploy Edge Function to Supabase cloud"
	@echo "  $(GREEN)make changelog$(RESET)      Print unreleased CHANGELOG entries"
	@echo ""

# ── Setup ─────────────────────────────────────────────────────────────────────
setup: _check-flutter env
	@echo "$(CYAN)▶ Installing Flutter dependencies...$(RESET)"
	@$(FLUTTER) pub get
	@echo "$(CYAN)▶ Running code generation...$(RESET)"
	@$(BUILD_RUNNER) build --delete-conflicting-outputs
	@echo ""
	@echo "$(GREEN)$(BOLD)✓ Setup complete!$(RESET)"
	@echo ""
	@echo "  Next steps:"
	@echo "  1. Edit $(BOLD).env$(RESET) with your Supabase URL + anon key"
	@echo "  2. Run $(BOLD)make supa-start$(RESET) to start local backend"
	@echo "  3. Run $(BOLD)make run$(RESET) to launch the app in Chrome"
	@echo ""

env:
	@if [ -f .env ]; then \
		echo "$(YELLOW)⚠  .env already exists — skipping copy$(RESET)"; \
	else \
		cp .env.example .env; \
		echo "$(GREEN)✓ Created .env from .env.example$(RESET)"; \
		echo "$(YELLOW)  ↳ Edit .env and fill in your credentials$(RESET)"; \
	fi

gen:
	@echo "$(CYAN)▶ Running build_runner...$(RESET)"
	@$(BUILD_RUNNER) build --delete-conflicting-outputs
	@echo "$(GREEN)✓ Code generation complete$(RESET)"

gen-watch:
	@echo "$(CYAN)▶ Watching for changes (build_runner watch)...$(RESET)"
	@$(BUILD_RUNNER) watch --delete-conflicting-outputs

clean:
	@echo "$(CYAN)▶ Cleaning build artifacts...$(RESET)"
	@$(FLUTTER) clean
	@find . -name "*.g.dart" -not -path "*/.*" -delete
	@find . -name "*.freezed.dart" -not -path "*/.*" -delete
	@find . -name "*.mocks.dart" -not -path "*/.*" -delete
	@echo "$(GREEN)✓ Clean complete$(RESET)"

# ── Run ───────────────────────────────────────────────────────────────────────
run: run-web

run-web: _check-flutter
	@echo "$(CYAN)▶ Launching on Chrome (Web)...$(RESET)"
	@$(FLUTTER) run -d chrome --web-port 3000

run-ios: _check-flutter
	@echo "$(CYAN)▶ Launching on iOS Simulator...$(RESET)"
	@DEVICE=$$($(FLUTTER) devices | grep "iPhone" | head -1 | awk -F'•' '{print $$2}' | xargs); \
	if [ -z "$$DEVICE" ]; then \
		echo "$(RED)✗ No iOS simulator found. Run: open -a Simulator$(RESET)"; exit 1; \
	fi; \
	$(FLUTTER) run -d "$$DEVICE"

run-android: _check-flutter
	@echo "$(CYAN)▶ Launching on Android Emulator...$(RESET)"
	@DEVICE=$$($(FLUTTER) devices | grep "emulator" | head -1 | awk '{print $$1}'); \
	if [ -z "$$DEVICE" ]; then \
		echo "$(RED)✗ No Android emulator running. Start one from Android Studio.$(RESET)"; exit 1; \
	fi; \
	$(FLUTTER) run -d "$$DEVICE"

run-macos: _check-flutter
	@echo "$(CYAN)▶ Launching on macOS...$(RESET)"
	@$(FLUTTER) run -d macos

# ── Quality ───────────────────────────────────────────────────────────────────
lint: _check-flutter
	@echo "$(CYAN)▶ Running flutter analyze...$(RESET)"
	@$(FLUTTER) analyze --fatal-infos
	@echo "$(GREEN)✓ No issues$(RESET)"

format: _check-dart
	@echo "$(CYAN)▶ Formatting Dart code...$(RESET)"
	@$(DART) format lib/ test/
	@echo "$(GREEN)✓ Formatted$(RESET)"

check: _check-flutter _check-dart
	@echo "$(CYAN)▶ Running CI checks locally...$(RESET)"
	@echo ""
	@echo "$(BOLD)[1/3] Lint$(RESET)"
	@$(FLUTTER) analyze --fatal-infos
	@echo ""
	@echo "$(BOLD)[2/3] Format$(RESET)"
	@$(DART) format --output=none --set-exit-if-changed lib/ test/
	@echo ""
	@echo "$(BOLD)[3/3] Tests$(RESET)"
	@$(FLUTTER) test
	@echo ""
	@echo "$(GREEN)$(BOLD)✓ All checks passed$(RESET)"

test: _check-flutter
	@echo "$(CYAN)▶ Running tests...$(RESET)"
	@$(FLUTTER) test --reporter expanded

test-coverage: _check-flutter
	@echo "$(CYAN)▶ Running tests with coverage...$(RESET)"
	@$(FLUTTER) test --coverage
	@which genhtml > /dev/null 2>&1 && \
		genhtml coverage/lcov.info -o coverage/html --quiet && \
		echo "$(GREEN)✓ Coverage report: coverage/html/index.html$(RESET)" && \
		open coverage/html/index.html 2>/dev/null || \
		echo "$(YELLOW)  Install lcov for HTML report: brew install lcov$(RESET)"

# ── Build ─────────────────────────────────────────────────────────────────────
build-web: _check-flutter
	@echo "$(CYAN)▶ Building Web (release)...$(RESET)"
	@$(FLUTTER) build web --release
	@echo "$(GREEN)✓ Output: build/web/$(RESET)"

build-ios: _check-flutter
	@echo "$(CYAN)▶ Building iOS IPA (release)...$(RESET)"
	@$(FLUTTER) build ipa --release
	@echo "$(GREEN)✓ Output: build/ios/ipa/$(RESET)"

build-android: _check-flutter
	@echo "$(CYAN)▶ Building Android App Bundle (release)...$(RESET)"
	@$(FLUTTER) build appbundle --release
	@echo "$(GREEN)✓ Output: build/app/outputs/bundle/release/$(RESET)"

# ── Supabase Local Dev ────────────────────────────────────────────────────────
supa-start: _check-supabase
	@echo "$(CYAN)▶ Starting local Supabase stack...$(RESET)"
	@$(SUPABASE) start
	@echo ""
	@$(MAKE) --no-print-directory supa-status

supa-stop: _check-supabase
	@echo "$(CYAN)▶ Stopping local Supabase stack...$(RESET)"
	@$(SUPABASE) stop
	@echo "$(GREEN)✓ Stopped$(RESET)"

supa-reset: _check-supabase
	@echo "$(YELLOW)▶ Resetting local DB (re-running all migrations)...$(RESET)"
	@$(SUPABASE) db reset
	@echo "$(GREEN)✓ DB reset complete$(RESET)"

supa-status: _check-supabase
	@echo "$(CYAN)▶ Local Supabase services:$(RESET)"
	@$(SUPABASE) status 2>/dev/null | grep -E "API URL|DB URL|Studio URL|anon key" | \
		sed 's/^/  /' || echo "  (not running — use make supa-start)"

supa-fn: _check-supabase
	@echo "$(CYAN)▶ Serving Edge Function '$(EDGE_FN)' locally...$(RESET)"
	@echo "  Function URL: http://localhost:54321/functions/v1/$(EDGE_FN)"
	@echo "  Press Ctrl+C to stop"
	@echo ""
	@$(SUPABASE) functions serve $(EDGE_FN) --env-file .env

# ── Release ───────────────────────────────────────────────────────────────────
deploy-fn: _check-supabase
	@echo "$(CYAN)▶ Deploying Edge Function '$(EDGE_FN)' to Supabase cloud...$(RESET)"
	@$(SUPABASE) functions deploy $(EDGE_FN) --no-verify-jwt
	@echo "$(GREEN)✓ Deployed$(RESET)"

changelog:
	@echo "$(CYAN)▶ Unreleased changes:$(RESET)"
	@awk '/^## \[Unreleased\]/{found=1; next} found && /^## \[/{exit} found{print}' CHANGELOG.md | \
		grep -v '^$$' | head -30 || echo "  (none)"

# ── Internal guards ───────────────────────────────────────────────────────────
_check-flutter:
	@which $(FLUTTER) > /dev/null 2>&1 || \
		(echo "$(RED)✗ flutter not found. Install: https://flutter.dev/docs/get-started$(RESET)" && exit 1)

_check-dart:
	@which $(DART) > /dev/null 2>&1 || \
		(echo "$(RED)✗ dart not found (should come with Flutter SDK)$(RESET)" && exit 1)

_check-supabase:
	@which $(SUPABASE) > /dev/null 2>&1 || \
		(echo "$(RED)✗ supabase CLI not found. Install: brew install supabase/tap/supabase$(RESET)" && exit 1)
