# Lumo Learn

> *Your AI English habit, in 5 minutes a day.*

A personalized AI-powered English learning app for iOS, Android, and Web. Built with Flutter + Supabase.

---

## Deploy to Railway (One-Click)

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template)

### Quick Start (Docker)

```bash
# 1. Clone and configure
git clone https://github.com/lumoryx/lumo-learn.git
cd lumo-learn
cp .env.example .env          # fill in SUPABASE_URL and SUPABASE_ANON_KEY

# 2. Build and run locally
docker-compose up --build     # → http://localhost:3000
```

### Railway Setup (First Time)

1. **Sign up** at [railway.app](https://railway.app)
2. **New Project** → **Deploy from GitHub repo** → select `lumoryx/lumo-learn`
3. **Environment Variables** (Settings → Variables):
   ```
   SUPABASE_URL      = https://your-project.supabase.co
   SUPABASE_ANON_KEY = your-anon-key
   APP_ENV           = production
   ```
4. **GitHub Secret** for CI/CD (GitHub repo → Settings → Secrets → Actions):
   ```
   RAILWAY_TOKEN = <Railway token from railway.app/account/tokens>
   ```
5. Push to `main` → CI runs → on green, Railway deploys automatically

### CI/CD Pipeline

```
feature branch  →  PR  →  CI checks (analyze + test + build)
                            ↓ all green
                         merge to main
                            ↓
                    deploy-railway.yml
                    (re-runs CI, then: railway up)
                            ↓
                    🚀 Live on Railway
```

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | Flutter 3.x (iOS / Android / Web) |
| Backend | Supabase (Auth + PostgreSQL + Edge Functions) |
| AI | OpenAI via Supabase Edge Function proxy |
| Subscriptions | RevenueCat |
| Push Notifications | Firebase Cloud Messaging |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.22.0`
- Dart SDK `>=3.4.0`
- A [Supabase](https://supabase.com) project
- An OpenAI API key (for the system-level AI config)

### 1. Clone the repo

```bash
git clone https://github.com/lumoryx/lumo-learn.git
cd lumo-learn
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure environment

Copy the example env file and fill in your values:

```bash
cp .env.example .env
```

```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
```

### 4. Run database migrations

```bash
supabase db push
```

### 5. Deploy Edge Functions

```bash
supabase functions deploy generate-daily-content
```

### 6. Run the app

```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# Web
flutter run -d chrome
```

---

## Branch Strategy

We follow a simplified GitFlow. See [Git Workflow](#git-workflow) for details.

| Branch | Purpose |
|--------|---------|
| `main` | Production — always deployable |
| `develop` | Integration — next release |
| `feature/*` | New features → merge into `develop` |
| `fix/*` | Bug fixes → merge into `develop` |
| `hotfix/*` | Emergency fixes → merge into `main` |
| `release/*` | Release prep → merge into `main` |

---

## Commit Convention

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>
```

Types: `feat` · `fix` · `ui` · `refactor` · `perf` · `test` · `docs` · `chore` · `ci`

Scopes: `auth` · `onboarding` · `home` · `learn` · `streak` · `theme` · `i18n` · `ai` · `paywall` · `share` · `settings` · `tts` · `supabase` · `ci`

---

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── router/          # go_router
│   ├── theme/           # 4 themes + ThemeExtension tokens
│   └── l10n/            # i18n (zh_CN, en_US)
├── data/
│   ├── models/          # Freezed models
│   ├── repositories/
│   └── services/        # Supabase, OpenAI, TTS, Share, Purchase
├── features/
│   ├── auth/
│   ├── onboarding/
│   ├── home/
│   ├── learn/
│   ├── celebrate/
│   ├── settings/
│   └── paywall/
└── shared/
    ├── widgets/
    └── providers/
```

---

## License

Proprietary — © 2026 Lumoryx. All rights reserved.
