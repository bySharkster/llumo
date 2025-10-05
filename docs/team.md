# Team Role Calibration — AI Personal Companion

> **Phase:** DEFINE
> **Owner:** @bySharkster
> **Status:** Draft → Approved
> **Last updated:** 2025-10-05

---

## 1. Team Overview

| Role                             | Member       | Responsibilities                                           | Tools / Access                  |
| -------------------------------- | ------------ | ---------------------------------------------------------- | ------------------------------- |
| **Product Lead**                 | @bySharkster | Oversees roadmap, coordinates I-DATIC progress             | GitHub Projects, Notion         |
| **Backend Lead**                 | TBD          | FastAPI architecture, Firebase integration, CI/CD backend  | Railway, GitHub Actions         |
| **Frontend Lead**                | TBD          | Flutter UI, notifications, and Auth integration            | Firebase, Android Studio, Xcode |
| **AI / NLP Engineer**            | TBD          | LangChain pipelines, intent detection, daily summary logic | OpenAI, LangChain               |
| **DevOps / QA**                  | TBD          | CI/CD, test automation, monitoring                         | GitHub Actions, Railway         |
| **Documentation / PM Assistant** | TBD          | Docs, PRDs, retrospectives, updates                        | Notion, GitHub Wiki             |

---

## 2. Communication Channels

| Purpose                  | Platform                           | Notes                    |
| ------------------------ | ---------------------------------- | ------------------------ |
| **Engineering Chat**     |  Discord                           | #engineering             |
| **AI Model Experiments** |  GitHub Discussions                | Record test logs         |
| **Weekly Sprint Review** |  Google Meet                       | Fridays 15:00 UTC        |
| **Documentation**        | `/docs`                            | Always updated per phase |

---

## 3. Responsibility Matrix (RACI)

| Activity            | Responsible (R) | Accountable (A) | Consulted (C) | Informed (I) |
| ------------------- | --------------- | --------------- | ------------- | ------------ |
| PRD Definition      | Product Lead    | Product Lead    | Engineering   | Team         |
| Architecture Design | Backend Lead    | Product Lead    | Frontend, AI  | Team         |
| AI Integration      | AI Engineer     | Backend Lead    | Product Lead  | QA           |
| Flutter UI          | Frontend Lead   | Product Lead    | Backend Lead  | Team         |
| CI/CD Setup         | DevOps          | Backend Lead    | QA            | Team         |
| Documentation       | PM Assistant    | Product Lead    | Everyone      | Everyone     |

---

## 4. Governance & Decision Flow

* **Strategic** (features, roadmap): Product Lead + all leads
* **Technical** (stack, CI/CD): Backend + DevOps
* **UX/UI**: Frontend Lead
* **AI behavior / LLM tuning**: AI Engineer
* **Approval flow:** PR → peer review → Product Lead merge

---

## Acceptance Criteria

* Document merged into `/docs/team.md`
* Each role assigned or marked `TBD`
* Communication & RACI table reviewed
* Linked to GitHub Project item → status → **To Define -> Complete**
