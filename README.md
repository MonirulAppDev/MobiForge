# 🛒 MobiForge — Enterprise Flutter E-Commerce Platform

> An enterprise-grade, production-hardened mobile e-commerce application engineered with **Clean Architecture** and **SOLID Principles** in Flutter & Dart.

---

## 📖 Table of Contents
1. [Executive Summary (For Non-Tech & Stakeholders)](#-executive-summary-for-non-tech--stakeholders)
2. [What is Clean Architecture? (Explain Like I'm 5)](#-what-is-clean-architecture-explain-like-im-5)
3. [Chronological Progress: What We Built & Why](#-chronological-progress-what-we-built--why)
   - [Phase 1: Core Foundation & Safe Error Handling](#phase-1-core-foundation--safe-error-handling)
   - [Phase 2: Security & Zero-Hardcoding Environment Setup](#phase-2-security--zero-hardcoding-environment-setup)
   - [Phase 3: Splash & Backend Health Check (Domain Layer)](#phase-3-splash--backend-health-check-domain-layer)
   - [Phase 4: Battle-Hardened Network Engine](#phase-4-battle-hardened-network-engine)
   - [Phase 5: Splash Data Layer — Freezed DTO & Model](#phase-5-splash-data-layer--freezed-dto--model)
4. [SOLID Principles in Action](#-solid-principles-in-action)
5. [Visual Network Pipeline](#-visual-network-pipeline)
6. [Tech Stack & Architecture Map](#-tech-stack--architecture-map)
7. [How to Run & Verify the Project](#-how-to-run--verify-the-project)

---

## 🌟 Executive Summary (For Non-Tech & Stakeholders)

**MobiForge** is not built like a typical hobbyist or demo mobile app. It is structured to handle millions of requests, real-world intermittent mobile connections (elevators, tunnels, switching between Wi-Fi and Mobile Data), financial transaction safety, and high-frequency code changes by large engineering teams without breaking.

Every line of code follows two industry gold standards:
1. **Clean Architecture**: Separates the visual screens, the business rules, and the raw data sources so that changes in one never crash the other.
2. **SOLID Principles**: Five foundational software engineering rules that guarantee code is maintainable, reusable, and easy to test.

---

## 💡 What is Clean Architecture? (Explain Like I'm 5)

Imagine building a high-end **Restaurant**:

```
┌────────────────────────────────────────────────────────┐
│ 1. PRESENTATION LAYER (Dining Hall & Waiters)          │
│    Customers order food, look at the menu, and eat.    │
├────────────────────────────────────────────────────────┤
│ 2. DOMAIN LAYER (The Master Recipes & Business Rules)  │
│    Defines what a dish is, ingredients, and prices.    │
│    Doesn't care which brand of stove is used.          │
├────────────────────────────────────────────────────────┤
│ 3. DATA LAYER (The Kitchen & Suppliers)                │
│    Gas stoves, refrigerators, vegetable suppliers.     │
│    Can change suppliers without changing the recipe.   │
└────────────────────────────────────────────────────────┘
```

- **Domain Layer**: The heart of the business (e.g., *What is a Product? What is an Order?*). It is pure Dart and has **zero** dependencies on screens, buttons, or external databases.
- **Data Layer**: Talks to external servers (APIs), phones' local storage, or payment gateways.
- **Presentation Layer**: The user interface (UI), animations, and state managers (BLoC/Riverpod) that show data to the user.

---

## 🚀 Chronological Progress: What We Built & Why

Here is the exact journey of everything engineered in this codebase so far:

### Phase 1: Core Foundation & Safe Error Handling

#### 1. Why do we have both `failures.dart` and `exceptions.dart`?
- **The Problem**: In low-level code, when a network call fails, it throws a technical `Exception` (e.g., `SocketException`, `DioException`). If this technical error leaks into the visual screens, the app crashes with a red error screen.
- **The Solution**:
  - [`exceptions.dart`](lib/core/errors/exceptions.dart): Used **strictly in the Data Layer** when something crashes behind the scenes (`ServerException`, `CacheException`, `NetworkException`).
  - [`failures.dart`](lib/core/errors/failures.dart): The Repository catches that crash and turns it into a friendly, safe `Failure` object (`ServerFailure`, `NetworkFailure`).
- **Analogy**: If a plate breaks in the kitchen (`Exception`), the waiter doesn't scream at the customer. The waiter politely says, *"Sorry, that dish is unavailable right now"* (`Failure`).

#### 2. Functional Typedefs (`typedefs.dart`)
- **What**: Created [`typedefs.dart`](lib/core/utils/typedefs.dart) with `ResultFuture<T>`.
- **Why**: Every business operation returns either a `Failure` or data `T`: `Future<Either<Failure, T>>`. Typing this 100 times clutters code. `ResultFuture<T>` is a clean shorthand.

#### 3. Base UseCase Contract (`usecase.dart`)
- **What**: Created [`usecase.dart`](lib/core/usecase/usecase.dart) defining `UseCaseWithParams` and `UseCaseWithoutParams`.
- **Why**: Enforces **Single Responsibility**. Every business action (Login, Fetch Products, Add to Cart) is its own separate class with a single `call()` method.

---

### Phase 2: Security & Zero-Hardcoding Environment Setup

#### 1. The Danger of Hardcoded URLs
- **The Problem**: Hardcoding `http://localhost:8080` in code is a critical vulnerability. It leaks internal IP addresses to production binaries and prevents switching between Development, Staging, and Production.

#### 2. The "Fail-Fast" Enterprise Principle
- **What**: Installed [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) and created [`.env`](.env) and [`.env.example`](.env.example).
- **Hardened Fix in [`env_config.dart`](lib/core/config/env_config.dart)**:
  - We **refused** to provide hidden fallback URLs in Dart code.
  - If a required key (like `BASE_URL`) is missing from `.env`, the app **immediately throws an explicit error at startup** (`CRITICAL CONFIG ERROR: BASE_URL is not defined in .env`).
  - **Why**: Zero silent bugs, zero accidental localhost calls in production.
- **Dynamic Endpoints in [`api_endpoints.dart`](lib/core/constants/api_endpoints.dart)**: Reads `EnvConfig.baseUrl` dynamically at runtime.

---

### Phase 3: Splash & Backend Health Check (Domain Layer)

To verify the app can speak to our backend (`http://localhost:8080/health`), we started with the **Splash / Onboarding Feature**:

1. **[`health_entity.dart`](lib/features/splash/domain/entities/health_entity.dart)**:
   - Pure business model representing backend health status (`app`, `environment`, `status`, `time`).
   - Contains business getter: `bool get isHealthy => status.toLowerCase() == 'ok';`.
   - Extends `Equatable` for instantaneous value comparisons.
2. **[`splash_repository.dart`](lib/features/splash/domain/repositories/splash_repository.dart)**:
   - Abstract contract: `ResultFuture<HealthEntity> checkServerHealth();`.
   - Follows **Dependency Inversion Principle (DIP)**: Domain dictates what it needs; Data layer will figure out how to fetch it.
3. **[`check_server_health_usecase.dart`](lib/features/splash/domain/usecases/check_server_health_usecase.dart)**:
   - Extends `UseCaseWithoutParams<HealthEntity>`.
   - Single responsibility: triggers the health check.

---

### Phase 4: Battle-Hardened Network Engine

Standard mobile network requests fail in real life. We audited every edge case and hardened the network pipeline in `lib/core/network/`:

#### 1. Edge Case: "Airplane Mode 21-Second Freeze"
- **The Problem**: If a user is on Airplane mode, Dio tries to open a socket, waits 15 seconds for DNS timeout, and retries 3 times (1s + 2s + 3s). The user waits **21 seconds** staring at a frozen screen!
- **The Solution**: Created [`network_info.dart`](lib/core/network/network_info.dart) with `connectivity_plus`. In [`api_interceptor.dart`](lib/core/network/api_interceptor.dart), we do a **Pre-Flight Connectivity Check**. If offline, it rejects **in 0 milliseconds** with `NetworkException`. Zero waiting time!

#### 2. Edge Case: "Tunnel & Elevator Micro-Drops"
- **The Problem**: When moving between Wi-Fi and 5G, or entering an elevator, a request temporarily drops. Showing an immediate error screen forces the user to manually click "Retry".
- **The Solution**: Built [`retry_interceptor.dart`](lib/core/network/retry_interceptor.dart):
  - Automatically retries up to **3 times** with exponential backoff delays (1s ➔ 2s ➔ 3s).
  - **Idempotency Protection for E-Commerce**: Only idempotent requests (`GET` requests like `/health` or product catalog) are retried automatically. Sensitive operations (like `POST /checkout` or payment) are never blindly retried to prevent double-charging credit cards!

#### 3. Single Responsibility Error Mapping (`dio_error_handler.dart`)
- **What**: Extracted all error translation logic from the interceptor into [`dio_error_handler.dart`](lib/core/network/dio_error_handler.dart).
- **Why**: Keeps [`api_interceptor.dart`](lib/core/network/api_interceptor.dart) strictly focused on HTTP middleware, while error parsing is 100% unit-testable in isolation.

#### 4. Enterprise Telemetry & Diagnostics (`app_talker.dart`)
- **What**: Integrated [`talker_flutter`](https://pub.dev/packages/talker_flutter) and [`talker_dio_logger`](https://pub.dev/packages/talker_dio_logger) in [`app_talker.dart`](lib/core/logging/app_talker.dart).
- **Why**: Replaces simple console `print` with a structured diagnostics engine that powers an in-app debug screen (`TalkerScreen`) for QA engineers and developers.

#### 5. Edge Case: "401 Token Refresh Race Condition (Thundering Herd)"
- **The Problem**: When access token expires, if the app makes 3 concurrent API calls (e.g. cart badge count, user profile, notifications), all 3 fail with 401 simultaneously and trigger 3 parallel refresh calls! This leads to session corruption and user logout.
- **The Solution**: Built [`auth_interceptor.dart`](lib/core/network/auth_interceptor.dart) using Dio's **`QueuedInterceptor`** and a mutex lock (`_refreshTokenFuture`).
- **Decoupled Architecture (SRP & DIP)**: Following SOLID, the interceptor does NOT make HTTP calls directly. It delegates to an abstract [`token_refresher.dart`](lib/core/network/token_refresher.dart) (`DioTokenRefresher`), which reuses the centralized [`ApiEndpoints.refreshToken`](lib/core/constants/api_endpoints.dart) and an isolated `refreshDio` instance to prevent recursive deadlocks. It updates all queued requests with the new bearer token and replays them automatically.

#### 6. Edge Case: "Memory Leaks & Zombie Requests"
- **The Problem**: When a user leaves a screen or types rapidly in search, uncompleted background requests continue to download data, drain battery, and trigger errors on unmounted widgets.
- **The Solution**: Created [`cancel_token_manager.dart`](lib/core/network/cancel_token_manager.dart). Automatically cancels prior requests with the same tag (e.g. during debounce) and provides clean lifecycle cancellation when screens are disposed.

---

### Phase 5: Splash Data Layer — Freezed DTO & Model

1. **[`health_model.dart`](lib/features/splash/data/models/health_model.dart)**:
   - Built with **`@freezed`** and **`json_serializable`** to eliminate 100% of handwritten boilerplate.
   - Generates immutable `copyWith()`, `operator ==`, `hashCode`, `toString()`, and defensive JSON serialization (`fromJson` / `toJson`).
   - **Complete Bidirectional Mapping (`.toEntity()` & `.fromEntity()`)**:
     - `toEntity()`: Converts API response DTO `HealthModel` into pure business [`HealthEntity`](lib/features/splash/domain/entities/health_entity.dart) to pass upstream to Domain & UI layers.
     - `fromEntity()`: Converts Domain `HealthEntity` back into `HealthModel` whenever the data layer needs to serialize, cache, or send data back to APIs.
     - The Domain layer remains 100% decoupled from third-party code generators.

2. **Declarative Retrofit REST Client ([`splash_remote_data_source.dart`](lib/features/splash/data/datasources/splash_remote_data_source.dart))**:
   - **Why Retrofit over Manual `dio.get()`?**: Manual `dio.get()` calls require hand-written URL strings, manual HTTP status code checks, manual parsing (`HealthModel.fromJson(response.data)`), and error-prone boilerplate. Retrofit eliminates 100% of this boilerplate by generating a compile-time, type-safe implementation (`_SplashRemoteDataSource`).
   - **Declarative Architecture (`@RestApi`)**: Uses `@GET(ApiEndpoints.health)` and `@CancelRequest() CancelToken? cancelToken`.
   - **Generated Plumbing ([`splash_remote_data_source.g.dart`](lib/features/splash/data/datasources/splash_remote_data_source.g.dart))**: Retrofit automatically handles request composition, headers, response type conversion (`ResponseType.json`), cancellation token binding, and JSON decoding directly into `HealthModel`.

3. **Enterprise Repository Implementation ([`splash_repository_impl.dart`](lib/features/splash/data/repositories/splash_repository_impl.dart))**:
   - **Boundary Isolation (DIP)**: Implements the Domain contract `SplashRepository` without leaking network implementation details.
   - **Pre-Flight Connectivity Guard**: Checks `networkInfo.isConnected` before dispatching network calls, returning `Left(NetworkFailure)` immediately if offline.
   - **Zero Exception Leakage (Error Boundary)**: Catches low-level `DioException`, `ServerException`, `NetworkException`, `FormatException`, and `TypeError`, safely converting them into strongly-typed `Failure` objects (`ServerFailure`, `NetworkFailure`). The presentation and domain layers never crash from unhandled exceptions.
   - **DTO to Entity Transformation**: Converts `HealthModel` to `HealthEntity` via `.toEntity()` to preserve layer segregation.

---

## 🧩 SOLID Principles in Action

| Principle | Meaning in Plain English | Real Example in MobiForge |
| :--- | :--- | :--- |
| **S - Single Responsibility** | A class should do one job and do it well. | `DioErrorHandler` only parses errors; `ApiInterceptor` only manages HTTP pipeline. |
| **O - Open/Closed** | Open for extension, closed for modification. | `Failure` base class allows adding new failures (`PaymentFailure`, `BiometricFailure`) without touching existing ones. |
| **L - Liskov Substitution** | Subclasses must seamlessly replace base classes. | `HealthModel` (Data layer) will seamlessly replace `HealthEntity` (Domain layer). |
| **I - Interface Segregation** | Small, specific contracts instead of bloated God-interfaces. | `SplashRepository` only has `checkServerHealth()`, keeping it lightweight. |
| **D - Dependency Inversion** | High-level business logic must never depend on low-level libraries. | `CheckServerHealthUseCase` depends on abstract `SplashRepository`, NOT on `Dio` or `Retrofit`. |

---

## 🔄 Visual Network Pipeline

When MobiForge makes an API call, this is the exact journey of the request:

```
[Mobile User Action / Screen Lifecycle]
       │
       ▼
[CancelTokenManager] ──(Screen Exited?)──────► Instantly Cancelled (Zero Waste)
       │
       ▼
[ApiInterceptor] ──────(No Internet?)────────► Instant Fail (0ms Pre-Flight Check)
       │ (Internet Available)
       ▼
[RetryInterceptor] ────(Transient Drop?)──────► Auto-Retry (1s, 2s, 3s backoff)
       │
       ▼
[AuthInterceptor] ─────(401 Expired?)────────► Queued Mutex Lock -> Auto-Refresh & Replay
       │
       ▼
[Dio HTTP Engine] ───────────────────────────► Backend API (http://localhost:8080/health)
       │
       ▼
[Talker Diagnostics] ────────────────────────► Real-Time In-App Network Inspector
       │
       ▼
[DioErrorHandler] ─────(HTTP 4xx / 5xx?)─────► Converts to clean ServerException
```

---

## 🛠️ Tech Stack & Architecture Map

| Category | Technology | Purpose in Project |
| :--- | :--- | :--- |
| **Core Framework** | Flutter 3.47.x / Dart 3.13.x | Cross-platform native mobile engine |
| **Architecture** | Feature-First Clean Architecture | Enterprise modularity and layer isolation |
| **Networking** | `Dio` + `Retrofit` | Low-level HTTP engine + Type-safe declarative REST API |
| **State Management** | `flutter_bloc` + `flutter_riverpod` | Predictable, reactive business state flows |
| **Dependency Injection** | `get_it` + `injectable` | Automatic compile-time dependency graph wiring |
| **Data Immutability** | `freezed` + `equatable` | Value equality and immutable data transfer objects |
| **Local Storage** | `hive_flutter` + `flutter_secure_storage` | High-speed cache boxes + Encrypted keychain token storage |
| **Logging & QA** | `talker_flutter` + `talker_dio_logger` | In-app debugger, performance telemetry, and network inspector |
| **Environment** | `flutter_dotenv` | Secure dynamic environment management (.env) |

---

## 💻 How to Run & Verify the Project

### 1. Prerequisites
- Flutter SDK `>=3.47.0`
- Dart SDK `>=3.13.4`

### 2. Environment Setup
Create a local `.env` file at the root of the project (or copy from `.env.example`):
```bash
cp .env.example .env
```

Ensure `.env` contains:
```properties
BASE_URL=http://localhost:8080
ENVIRONMENT=development
CONNECT_TIMEOUT=15000
RECEIVE_TIMEOUT=15000
```

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Health & Code Quality Check
Verify that there are zero warnings, zero errors, and zero linter issues:
```bash
flutter analyze
```
*(Expected output: `No issues found!`)*

---

*Authored with strict adherence to senior enterprise software architecture guidelines.*
