# ENV Configuration

Phase: DEFINE
Task: Environment Configuration
Scope: Flutter app, FastAPI backend, Firebase, GitHub Actions, Railway/Render

This document defines .env templates, secret handling, and runtime flags for each environment: local, development (dev), and production (prod).

---

## 1) Backend (.env.example)

```
# ---- App ----
APP_NAME=llumo-api
APP_ENV=local
APP_PORT=8000
LOG_LEVEL=INFO

# ---- Security ----
ALLOWED_ORIGINS=*

# ---- OpenAI ----
OPENAI_API_KEY=
OPENAI_MODEL=gpt-4o-mini

# ---- Firebase (client) ----
FIREBASE_PROJECT_ID=
FIREBASE_API_KEY=
FIREBASE_AUTH_DOMAIN=
FIREBASE_STORAGE_BUCKET=
FIREBASE_MESSAGING_SENDER_ID=
FIREBASE_APP_ID=

# ---- Firebase (admin/server) ----
FIREBASE_SERVICE_ACCOUNT_BASE64=

# ---- Firestore ----
FIREBASE_DATABASE_URL=

# ---- Notifications ----
DAILY_SUMMARY_HOUR=8

# ---- External URLs ----
PUBLIC_BASE_URL=https://api.llumo.app
```

---

## 2) Backend settings loader (FastAPI)

```
from pydantic import BaseSettings
from functools import lru_cache
import base64, json, os, tempfile

class Settings(BaseSettings):
    APP_NAME: str = "llumo-api"
    APP_ENV: str = "local"
    APP_PORT: int = 8000
    LOG_LEVEL: str = "INFO"
    ALLOWED_ORIGINS: str = "*"

    OPENAI_API_KEY: str = ""
    OPENAI_MODEL: str = "gpt-4o-mini"

    FIREBASE_PROJECT_ID: str = ""
    FIREBASE_API_KEY: str = ""
    FIREBASE_AUTH_DOMAIN: str | None = None
    FIREBASE_STORAGE_BUCKET: str | None = None
    FIREBASE_MESSAGING_SENDER_ID: str | None = None
    FIREBASE_APP_ID: str | None = None
    FIREBASE_SERVICE_ACCOUNT_BASE64: str | None = None

    DAILY_SUMMARY_HOUR: int = 8
    PUBLIC_BASE_URL: str = "https://api.llumo.app"

    class Config:
        env_file = ".env"
        case_sensitive = True

@lru_cache
def get_settings():
    return Settings()

def write_service_account_temp(settings: Settings):
    b64 = settings.FIREBASE_SERVICE_ACCOUNT_BASE64
    if not b64:
        return None
    data = base64.b64decode(b64)
    obj = json.loads(data)
    fd, path = tempfile.mkstemp(prefix="firebase-", suffix=".json")
    with os.fdopen(fd, 'w') as f:
        json.dump(obj, f)
    return path
```

---

## 3) Flutter env configuration (lib/env.dart)

```
class Env {
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8000',
  );

  static const firebaseProjectId = String.fromEnvironment('FIREBASE_PROJECT_ID', defaultValue: '');
  static const firebaseApiKey = String.fromEnvironment('FIREBASE_API_KEY', defaultValue: '');
  static const firebaseAppId = String.fromEnvironment('FIREBASE_APP_ID', defaultValue: '');
  static const firebaseSenderId = String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID', defaultValue: '');
}
```

---

## 4) Flutter run examples

```
# Local debug (Android emulator)
flutter run \
  --dart-define=API_BASE_URL=http://10.0.2.2:8000 \
  --dart-define=FIREBASE_PROJECT_ID=your-project-id \
  --dart-define=FIREBASE_API_KEY=your-api-key \
  --dart-define=FIREBASE_APP_ID=your-app-id \
  --dart-define=FIREBASE_MESSAGING_SENDER_ID=your-sender-id

# Release build (production)
flutter build apk --release \
  --dart-define=API_BASE_URL=https://api.llumo.app \
  --dart-define=FIREBASE_PROJECT_ID=prod-project-id \
  --dart-define=FIREBASE_API_KEY=prod-api-key \
  --dart-define=FIREBASE_APP_ID=prod-app-id \
  --dart-define=FIREBASE_MESSAGING_SENDER_ID=prod-sender-id
```

---

## 5) GitHub Actions CI

```
- name: Generate backend .env
  working-directory: backend
  run: |
    cat > .env << 'EOF'
    APP_NAME=llumo-api
    APP_ENV=dev
    APP_PORT=8000
    LOG_LEVEL=INFO
    ALLOWED_ORIGINS=*
    OPENAI_API_KEY=${{ secrets.OPENAI_API_KEY }}
    OPENAI_MODEL=gpt-4o-mini
    FIREBASE_PROJECT_ID=${{ vars.FIREBASE_PROJECT_ID }}
    FIREBASE_API_KEY=${{ secrets.FIREBASE_API_KEY }}
    FIREBASE_SERVICE_ACCOUNT_BASE64=${{ secrets.FIREBASE_SERVICE_ACCOUNT_BASE64 }}
    PUBLIC_BASE_URL=${{ vars.PUBLIC_BASE_URL }}
    EOF
```

Set repository secrets and variables:

* Secrets: OPENAI_API_KEY, FIREBASE_API_KEY, FIREBASE_SERVICE_ACCOUNT_BASE64, RAILWAY_TOKEN or RENDER_DEPLOY_HOOK_URL
* Variables: PUBLIC_BASE_URL, FIREBASE_PROJECT_ID, APP_ENV

---

## 6) Firebase setup

* Add Android and iOS apps in Firebase Console.
* Download google-services.json to frontend/android/app/.
* Download GoogleService-Info.plist to frontend/ios/Runner/.
* Enable Authentication and Cloud Messaging.

---

## 7) Production notes

* Restrict ALLOWED_ORIGINS in production.
* Use separate Firebase projects for dev and prod.
* Rotate keys regularly.

---

## 8) Checklist

* [ ] Commit backend/.env.example
* [ ] Commit frontend/lib/env.dart
* [ ] Add GitHub secrets/variables
* [ ] Test backend with POST /api/health using .env
* [ ] Run Flutter with dart-define values
* [ ] Verify FCM push works on device
