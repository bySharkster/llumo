# Llumo — AI Personal Companion

> Your personal AI companion that plans your day — learning your rhythm, not just your reminders.

---

## Overview

Llumo is a cross-platform AI assistant designed to simplify daily life through intelligent reminders, habit learning, and smart daily summaries.
It’s built as a mobile app (Flutter) connected to a FastAPI backend with integrations for Firebase and OpenAI.

The project is developed using the I-DATIC Framework — a structured five-phase methodology (DEFINE → ANALYZE → TEST → IMPLEMENT → CONFIRM) to ensure clear goals, systematic development, and continuous learning.

---

## Key Features

* Conversational AI chat for personal planning
* Smart habit recognition and automatic reminders
* Daily “Today’s Plan” summary via notifications
* Secure authentication with Firebase
* Cross-platform support (Android & iOS)
* Privacy-first, cloud-based data management

---

## Tech Stack

| Layer                | Technology             | Purpose                             |
| -------------------- | ---------------------- | ----------------------------------- |
| Frontend             | Flutter (Dart)         | Mobile app and chat interface       |
| Backend              | FastAPI (Python)       | API, orchestration, business logic  |
| Database             | Firebase Firestore     | Real-time user data & reminders     |
| AI Layer             | LangChain + OpenAI API | NLP, intent parsing, summarization  |
| Auth & Notifications | Firebase Auth + FCM    | Authentication & push notifications |
| Deployment           | Railway / Render       | FastAPI hosting & CI/CD targets     |
| CI/CD                | GitHub Actions         | Build, test, deploy automation      |

---

## Repository Structure

```
ai-personal-companion/
├── backend/                 # FastAPI backend
│   ├── app/
│   ├── tests/
│   ├── requirements.txt
│   └── Dockerfile
├── frontend/                # Flutter app
│   ├── lib/
│   ├── android/
│   ├── ios/
│   └── pubspec.yaml
├── docs/                    # Documentation
│   ├── PRD.md
│   ├── architecture.md
│   ├── team.md
│   ├── env-configuration.md
│   └── roadmap_idatic.md
└── .github/                 # CI/CD workflows
```

---

## Getting Started

### Prerequisites

* Python 3.11+
* Flutter SDK 3.24+
* Firebase project configured (Auth, Firestore, FCM)
* OpenAI API key

### 1. Clone the repository

```
git clone https://github.com/<your-org>/ai-personal-companion.git
cd ai-personal-companion
```

### 2. Backend setup

```
cd backend
cp .env.example .env
# fill values
pip install -r requirements.txt
uvicorn app.main:app --reload
```

Verify backend:

```
curl http://localhost:8000/api/health
```

### 3. Frontend setup

```
cd ../frontend
flutter pub get
flutter run \
  --dart-define=API_BASE_URL=http://10.0.2.2:8000 \
  --dart-define=FIREBASE_PROJECT_ID=your-project-id \
  --dart-define=FIREBASE_API_KEY=your-api-key \
  --dart-define=FIREBASE_APP_ID=your-app-id \
  --dart-define=FIREBASE_MESSAGING_SENDER_ID=your-sender-id
```

---

## I-DATIC Framework Alignment

| Phase     | Description                            | Deliverable                  |
| --------- | -------------------------------------- | ---------------------------- |
| DEFINE    | Define scope, architecture, team roles | PRD, Architecture, ENV setup |
| ANALYZE   | Identify risks & dependencies          | Risk Matrix, Data Schema     |
| TEST      | Prototype & validate MVP               | Integration tests, feedback  |
| IMPLEMENT | Deploy production build                | CI/CD, release pipeline      |
| CONFIRM   | Capture learning                       | Retrospective, Playbook      |

---

## Environment Configuration

Refer to [ENV Configuration](https://github.com/bySharkster/llumo/blob/main/docs/env-configuration.md) for:

* `.env` structure for backend
* `--dart-define` config for Flutter
* Firebase, GitHub Secrets, and CI/CD setup

---

## Development Standards

* Use feature branches (`feat/<name>`).
* Pull requests must include:

  * Lint and tests passing
  * Linked GitHub Project item
  * Updated docs if configuration or architecture changed
* Follow semantic commit messages (`feat:`, `fix:`, `chore:`).

---

## Project Links

* Documentation: [docs/](https://github.com/bySharkster/llumo/tree/main/docs)
* Architecture: [docs/architecture.md](https://github.com/bySharkster/llumo/blob/main/docs/architecture.md#ai-personal-companion--system-architecture)
* PRD: [docs/PRD.md](https://github.com/bySharkster/llumo/blob/main/docs/PRD.md#ai-personal-companion--product-requirements-document-prd)
* Team Roles: [docs/team.md](https://github.com/bySharkster/llumo/blob/main/docs/team.md#team-role-calibration--ai-personal-companion)
* Framework Reference: [I-DATIC v1.0 (Zenodo DOI)](https://doi.org/10.5281/zenodo.17081914)

---

## License

MIT License © 2025 — Llumo Project Team
