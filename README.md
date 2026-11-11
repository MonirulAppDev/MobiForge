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
   - [Phase 6: Compile-Time Dependency Injection](#phase-6-compile-time-dependency-injection-injection_containerdart)
   - [Phase 7: Modern Riverpod State Management](#phase-7-modern-riverpod-state-management-splash_controllerdart)
   - [Phase 8: Enterprise Multi-Flavor Architecture](#phase-8-enterprise-multi-flavor-architecture-dev-staging-prod)
   - [Phase 9: Network Timeout Optimization & ADB Port Forwarding](#phase-9-network-timeout-optimization--physical-device-port-forwarding)
   - [Phase 10: Remote Mobile Config & Microservices Registry](#phase-10-remote-mobile-configuration--microservice-service-registry)
   - [Phase 11: Enterprise User Registration & Clean Auth Architecture](#phase-11-enterprise-user-registration--clean-auth-architecture)
   - [Phase 12: Dual-Stack Host Health Check & Root Origin Resolution](#phase-12-dual-stack-host-health-check--root-origin-resolution)
   - [Phase 13: Modular Design System & Orange-Charcoal Theme Engine](#phase-13-modular-design-system--orange-charcoal-theme-engine)
   - [Phase 14: Presentation Layer Purity & Strict SOLID/Clean-Architecture Audit](#phase-14-presentation-layer-purity--strict-solidclean-architecture-audit)
   - [Phase 15: Executive UI Minimalism & Widget Decomposition](#phase-15-executive-ui-minimalism--widget-decomposition)
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

3. **Centralized Error Boundary Base Repository ([`base_repository.dart`](lib/core/repositories/base_repository.dart))**:
   - **DRY & Single Responsibility**: Centralizes pre-flight connectivity checks and exhaustive error mapping (`DioException`, `ServerException`, `NetworkException`, `FormatException`, `TypeError`, catch-all) into a reusable `safeNetworkCall` method. Eliminates repetitive 30-line try-catch boilerplate across all future feature repositories.

4. **Enterprise Repository Implementation ([`splash_repository_impl.dart`](lib/features/splash/data/repositories/splash_repository_impl.dart))**:
   - **Boundary Isolation (DIP)**: Implements the Domain contract `SplashRepository` without leaking network implementation details.
   - **Ultra-Clean Execution**: Extends `BaseRepository` to invoke `safeNetworkCall` in just 6 lines, ensuring 100% layer isolation and zero exception leakage.
   - **DTO to Entity Transformation**: Converts `HealthModel` to `HealthEntity` via `.toEntity()` to preserve pure domain logic.

---

### Phase 6: Compile-Time Dependency Injection (`injection_container.dart`)

1. **Central Service Locator ([`injection_container.dart`](lib/core/di/injection_container.dart))**:
   - Built with **`GetIt`** (`sl`) and **`@InjectableInit`** for automatic, compile-time dependency graph generation.
   - Eliminates 100% of handwritten manual locator code (`sl.registerLazySingleton(...)`).

2. **Feature Modularity ([`splash_module.dart`](lib/features/splash/splash_module.dart))**:
   - **Preserves Domain Layer Purity**: Provides `CheckServerHealthUseCase` without forcing the Domain layer to import third-party DI annotations.
   - **Retrofit DI Wiring**: Instantiates `SplashRemoteDataSource(dio)` cleanly with the configured primary `Dio` singleton.

3. **Generated Dependency Graph ([`injection_container.config.dart`](lib/core/di/injection_container.config.dart))**:
   - Complete dependency resolution order:
     `Connectivity` ➔ `NetworkInfo` ➔ `TokenStorage` ➔ `refreshDio` ➔ `TokenRefresher` ➔ `ApiInterceptor` ➔ `Dio` ➔ `SplashRemoteDataSource` ➔ `SplashRepositoryImpl` (as `SplashRepository`) ➔ `CheckServerHealthUseCase`.
   - Compile-time verified with zero missing dependencies.

---

### Phase 7: Modern Riverpod State Management (`splash_controller.dart`)

1. **Declarative AsyncNotifier ([`splash_controller.dart`](lib/features/splash/presentation/controllers/splash_controller.dart))**:
   - Built with **`riverpod_annotation`** and code generation (`@riverpod`).
   - Automatically returns native **`AsyncValue<HealthEntity>`** for pattern matching (`.when()`).
   - **Bridging GetIt & Riverpod**: Injects `CheckServerHealthUseCase` from GetIt via `checkServerHealthUseCaseProvider`, making the entire presentation layer easily mockable in widget tests without touching the Service Locator.
   - **Idiomatic Retry Flow**: Implements `retry()` leveraging `AsyncValue.guard`, seamlessly flipping states to `AsyncLoading()` and executing clean retries.
   - **Zero Boilerplate**: Generated `splash_controller.g.dart` wires up auto-dispose lifecycle management to eliminate memory leaks.

2. **Atomic Presentation Widgets ([`widgets/`](lib/features/splash/presentation/widgets/))**:
   - **Single Responsibility (Under 150 Lines)**: Decomposed into atomic, reusable UI components:
     - [`splash_loading_view.dart`](lib/features/splash/presentation/widgets/splash_loading_view.dart): Renders pulsing brand spinner with smooth `flutter_animate` text fades.
     - [`splash_error_view.dart`](lib/features/splash/presentation/widgets/splash_error_view.dart): Renders cloud-off illustration, error status badge (`HTTP 503`), user-friendly message, and interactive "Retry Connection" CTA.
     - [`splash_success_view.dart`](lib/features/splash/presentation/widgets/splash_success_view.dart): Displays green health badge with backend metadata (`app`, `environment`, `status`).

3. **Responsive Splash Screen ([`splash_screen.dart`](lib/features/splash/presentation/screens/splash_screen.dart))**:
   - Extends **`ConsumerWidget`** to consume `SplashController`.
   - **Side-Effects Management (`ref.listen`)**: Logs health check outcomes directly to `AppTalker` diagnostics for QA.
   - **Declarative Pattern Matching (`.when()`)**: Compiles exhaustive UI branches (`data`, `loading`, `error`), guaranteeing zero unhandled visual states.
   - Fully responsive layout engineered with `flutter_screenutil` and `gap`.

4. **Production App Entry Point ([`main.dart`](lib/main.dart))**:
   - Orchestrates async bootstrap sequence: `WidgetsFlutterBinding` ➔ `EnvConfig.init()` (Fail-Fast) ➔ `configureDependencies()` (GetIt/Injectable).
   - Wraps application in **`ProviderScope`** equipped with custom **[`AppRiverpodObserver`](lib/core/logging/riverpod_talker_observer.dart)** for real-time telemetry into `Talker`.

---

### Phase 8: Enterprise Multi-Flavor Architecture (`dev`, `staging`, `prod`)

1. **Native Android Product Flavors ([`build.gradle.kts`](android/app/build.gradle.kts))**:
   - Declares `flavorDimensions += "default"` with three isolated build flavors:
     - **`dev`**: `applicationIdSuffix = ".dev"`, App Name: `"MobiForge Dev"`.
     - **`staging`**: `applicationIdSuffix = ".staging"`, App Name: `"MobiForge Staging"`.
     - **`prod`**: `applicationId = "com.monirul.mobiforge"`, App Name: `"MobiForge"`.
   - Enables all three variations to be installed **side-by-side on the same physical device** without overwriting each other.

2. **Environment Isolation**:
   - [`.env.dev`](.env.dev): Points to local/dev backend (`http://localhost:8080`).
   - [`.env.staging`](.env.staging): Points to staging/QA backend (`https://staging-api.mobiforge.com`).
   - [`.env.prod`](.env.prod): Points to live production backend (`https://api.mobiforge.com`).
   - Dynamic typed loading via [`EnvConfig.init(flavor: AppFlavor)`](lib/core/config/env_config.dart).

3. **Dedicated Entry Points & VS Code Integration**:
   - [`lib/main_dev.dart`](lib/main_dev.dart) ➔ `flutter run --flavor dev -t lib/main_dev.dart`
   - [`lib/main_staging.dart`](lib/main_staging.dart) ➔ `flutter run --flavor staging -t lib/main_staging.dart`
   - [`lib/main_prod.dart`](lib/main_prod.dart) ➔ `flutter run --flavor prod -t lib/main_prod.dart`
   - [`.vscode/launch.json`](.vscode/launch.json): 1-click debug launcher for each flavor in VS Code.

---

### Phase 9: Network Timeout Optimization & Physical Device Port Forwarding

1. **Edge Case: Mobile Dual-Stack Timeout Multiplication (3-4 Minute Freeze)**:
   - **The Problem**: On physical Android devices, querying `localhost` triggers dual-stack DNS (IPv6 `[::1]` falling back to IPv4 `127.0.0.1`). If `CONNECT_TIMEOUT` is 15 seconds, a single failed attempt takes 30 seconds. Combined with 3 auto-retries (1s + 2s + 3s), the app freezes in loading for **3 to 4 minutes** before rendering an error!
   - **The Solution**: 
     - Reduced `CONNECT_TIMEOUT` to **5000ms (5 seconds)** and `RECEIVE_TIMEOUT` to **8000ms (8 seconds)** across all environment configs.
     - Hardened [`RetryInterceptor`](lib/core/network/retry_interceptor.dart) to `maxRetries = 2` with swift delays (800ms, 1000ms), bringing total failure detection down from 240 seconds to **under 15 seconds**.
     - Configured `sendTimeout` in `Dio` BaseOptions.

2. **Physical Device `localhost` Networking via ADB Reverse**:
   - On a physical phone, `localhost` points to the phone itself, not the host computer.
   - Forwarding host backend ports via Android Debug Bridge (ADB):
     ```bash
     8080..8088 | ForEach-Object { adb reverse "tcp:$_" "tcp:$_" }
     ```
   - Automatically routes all phone requests to `http://localhost:8080` (and microservices 8081-8088) directly to the PC's backend server over USB.

---

### Phase 10: Remote Mobile Configuration & Microservice Service Registry

1. **Dynamic Remote Bootstrap Architecture**:
   - Switched from raw health ping to production-grade remote mobile configuration: `http://localhost:8080/api/v1/mobile/config`.
   - Payload captures full enterprise operational metadata:
     - **Dynamic Feature Flags**: `mock_ai_enabled`, `mock_otp_enabled`, `mock_payment_enabled`, `testing_toolkit`.
     - **Microservice Service Registry**: Dynamic URLs for `auth`, `catalog`, `commerce`, `payments`, `ai`, `media`, `notifications`, `chat`, and `unified` gateway.
     - **Gatekeeper Controls**: Dynamic `maintenance_mode` with custom broadcast message, plus `force_update` version checks.

2. **Clean Architecture Domain Entities ([`mobile_config_entity.dart`](lib/features/splash/domain/entities/mobile_config_entity.dart))**:
   - Pure business objects (`MobileConfigEntity`, `ConfigFeaturesEntity`, `ConfigServicesEntity`) extending `Equatable`.
   - Free from serialization and UI dependencies.

3. **Freezed & JSON Serializable Data Models ([`mobile_config_model.dart`](lib/features/splash/data/models/mobile_config_model.dart))**:
   - Automated immutable data transfer objects with bidirectional transformation (`.toEntity()` and `.fromEntity()`).

4. **Centralized Service Registry Singleton ([`app_config_manager.dart`](lib/core/config/app_config_manager.dart))**:
   - Thread-safe repository caching the active remote configuration in memory.
   - Downstream features can query microservice URLs and feature flags dynamically without duplicate network roundtrips.

5. **Minimal Executive Splash Screen**:
   - Clean, decluttered design focusing on brand elegance:
     - Normal operational state: Subtle, animated "Ready • v1.2.0" status chip.
     - Maintenance state: Friendly, non-blocking maintenance dialog.
     - Force update state: Clean version upgrade prompt.
     - Zero technical JSON dumps or cluttered debug badges.

---

### Phase 11: Enterprise User Registration & Clean Auth Architecture

#### 1. What Was Built
- **Domain Layer ([`lib/features/auth/domain/`](lib/features/auth/domain/))**:
  - Pure business entities: [`UserEntity`](lib/features/auth/domain/entities/user_entity.dart) and [`RoleEntity`](lib/features/auth/domain/entities/role_entity.dart) extending `Equatable`.
  - Immutable input parameter object: [`RegisterParams`](lib/features/auth/domain/entities/register_params.dart).
  - Business repository contract: [`AuthRepository`](lib/features/auth/domain/repositories/auth_repository.dart).
  - Single Responsibility business use case: [`RegisterUseCase`](lib/features/auth/domain/usecases/register_usecase.dart).
- **Data Layer ([`lib/features/auth/data/`](lib/features/auth/data/))**:
  - Immutable Data Transfer Objects with Freezed & JSON Serialization: [`UserModel`](lib/features/auth/data/models/user_model.dart), [`RoleModel`](lib/features/auth/data/models/role_model.dart), [`RegisterRequestModel`](lib/features/auth/data/models/register_request_model.dart), and [`RegisterResponseModel`](lib/features/auth/data/models/register_response_model.dart).
  - Declarative Retrofit REST API Client: [`AuthRemoteDataSource`](lib/features/auth/data/datasources/auth_remote_data_source.dart) targeting `POST /auth/register`.
  - Production-hardened Repository implementation: [`AuthRepositoryImpl`](lib/features/auth/data/repositories/auth_repository_impl.dart) inheriting centralized pre-flight checks and exception boundaries from `BaseRepository`.
  - Dependency Injection Module: [`AuthModule`](lib/features/auth/auth_module.dart) wiring Retrofit and UseCase into GetIt.
- **Presentation Layer ([`lib/features/auth/presentation/`](lib/features/auth/presentation/))**:
  - Declarative state management via Riverpod: [`RegisterController`](lib/features/auth/presentation/controllers/register_controller.dart) returning `AsyncValue<UserEntity?>`.
  - Modern Executive Registration Screen: [`RegisterScreen`](lib/features/auth/presentation/screens/register_screen.dart).
  - Atomic UI Components (< 150 lines): [`RegisterHeader`](lib/features/auth/presentation/widgets/register_header.dart), [`RegisterForm`](lib/features/auth/presentation/widgets/register_form.dart), and [`RegisterSuccessDialog`](lib/features/auth/presentation/widgets/register_success_dialog.dart).
  - Centralized Navigation Engine: [`app_router.dart`](lib/core/routes/app_router.dart) built with `go_router` featuring seamless transitions from Splash to Register.

#### 2. Why It Was Built (The Problem It Solves)
- User onboarding is the primary gateway for an e-commerce platform. Without strict input validation, type-safe network mapping, and proper error translation, onboarding drops precipitously due to confusing error messages (e.g. raw 409 database unique key errors).
- This implementation provides a robust, delightful onboarding journey with immediate client-side validation, safe network boundaries, and executive confirmation dialogs.

#### 3. How It Was Implemented (Architectural Patterns & Trade-offs)
- **Strict Clean Architecture Layer Isolation**: The Domain Layer remains completely unaware of whether the API is REST, GraphQL, or simulated. It has zero dependencies on Flutter UI, Dio, or JSON serialization.
- **GetIt + Riverpod Bridge**: `RegisterUseCase` is registered via compile-time Injectable into GetIt and surfaced into the Riverpod graph via `registerUseCaseProvider`. This enables effortless mock overrides in widget tests.
- **Atomic Decomposition**: Each widget in `presentation/widgets/` is kept strictly under 150 lines, honoring the Single Responsibility Principle and optimizing Flutter's element rebuild cycles.

#### 4. Critical Edge Cases & Failure Modes Handled
1. **Duplicate Email Conflict (HTTP 409)**: Caught by `safeNetworkCall` and extracted by `DioErrorHandler`, displaying a friendly *"email already registered"* floating banner rather than crashing.
2. **Offline & Intermittent Drops**: Pre-flight network check (`BaseRepository`) catches offline status immediately in 0ms without wasting battery or HTTP connections.
3. **Password Security**: Obscure text toggle with explicit show/hide icon and minimum character safety.
4. **Memory Leaks**: All `TextEditingController` instances are safely disposed in `State.dispose()`.

---

### Phase 12: Dual-Stack Host Health Check & Root Origin Resolution

#### 1. What Was Built
- **Environment & LAN Host Configuration ([`.env.dev`](.env.dev), [`.env`](.env), [`.env.example`](.env.example))**:
  - Configured base URL to `http://10.192.168.134:8080` so that root `/health` and sub-path `/api/v1` routes both resolve cleanly without path mangling.
- **Endpoints Architecture ([`api_endpoints.dart`](lib/core/constants/api_endpoints.dart))**:
  - `health = '/health'`
  - `mobileConfig = '/api/v1/mobile/config'`
  - `register = '/api/v1/auth/register'`
- **Domain Layer ([`lib/features/splash/domain/`](lib/features/splash/domain/))**:
  - Restored [`HealthEntity`](lib/features/splash/domain/entities/health_entity.dart) with `isHealthy` business getter.
  - Added [`CheckServerHealthUseCase`](lib/features/splash/domain/usecases/check_server_health_usecase.dart).
- **Data Layer ([`lib/features/splash/data/`](lib/features/splash/data/))**:
  - Created [`HealthModel`](lib/features/splash/data/models/health_model.dart) with Freezed & JSON serialization.
  - Pure declarative Retrofit REST API client [`SplashRemoteDataSource`](lib/features/splash/data/datasources/splash_remote_data_source.dart) directly handling both `@GET(ApiEndpoints.health)` and `@GET(ApiEndpoints.mobileConfig)` with zero redundant intermediate wrappers.
- **Presentation Layer**:
  - Updated [`SplashController`](lib/features/splash/presentation/controllers/splash_controller.dart) to verify health check and fetch dynamic mobile configuration.
  - Updated [`SplashSuccessView`](lib/features/splash/presentation/widgets/splash_success_view.dart) to show server online status with backend metadata badges.

#### 2. Why It Was Built (The Problem It Solves)
- When `BASE_URL` contains an API version prefix like `/api/v1`, standard HTTP clients append relative paths, turning `/health` into `/api/v1/health`.
- On real-world microservices backends, Kubernetes ingress, and Go/Node gateways, health probes (`/health`) are hosted at the root origin level, while business APIs reside under `/api/v1`. This mismatch resulted in immediate 404 errors.
- The new origin resolver guarantees that `/health` queries the root server while all subsequent business calls automatically route to `/api/v1`.

---

### Phase 13: Modular Design System & Orange-Charcoal Theme Engine

#### 1. What Was Built
- **Modular Theme Architecture ([`lib/core/theme/`](lib/core/theme/))**:
  - [`AppColorSchemeConfig`](lib/core/theme/app_color_scheme.dart): Configures Material 3 Light & Dark ColorSchemes uniting signature **Vibrant Orange (`#FF6B00`)** with **Deep Charcoal (`#121214`)**.
  - [`AppTypographyConfig`](lib/core/theme/app_typography.dart): Complete **Poppins** typography system with strictly enforced **body font size 12 (`bodyMedium`)**.
  - [`AppButtonThemeConfig`](lib/core/theme/app_button_theme.dart): Unified theme specifications for `ElevatedButton`, `OutlinedButton`, and `TextButton`.
  - [`AppInputThemeConfig`](lib/core/theme/app_input_theme.dart): Refined text field input decorations with 12px radii, focus accent rings, and clean error states.
  - [`AppBarThemeConfig`](lib/core/theme/app_bar_theme.dart): Zero-elevation AppBars equipped with adaptive edge-to-edge system navigation overlays.
  - [`AppCardThemeConfig`](lib/core/theme/app_card_theme.dart): Rounded surface cards (`16px`) and modal dialog styling.
  - [`AppTheme`](lib/core/theme/app_theme.dart): Central Base Theme Aggregator compiling all discrete component configurations into production `ThemeData lightTheme` and `ThemeData darkTheme`.
- **Application Integration ([`lib/main.dart`](lib/main.dart))**:
  - Attached `AppTheme.lightTheme` and `AppTheme.darkTheme` to `MaterialApp.router`.
  - Updated centralized color palette [`AppColors`](lib/core/constants/app_colors.dart) to propagate the Orange-Charcoal brand across legacy widgets.

#### 2. Why It Was Built (The Problem It Solves)
- Standard Flutter apps commonly declare giant monolithic `ThemeData` blocks spanning hundreds of unmaintainable lines inside `main.dart`.
- This modular architecture decomposes every UI element (buttons, typography, inputs, cards) into dedicated, isolated classes following the **Single Responsibility Principle**.
- A new designer or developer can customize button styles or input borders without risking regressions across colors or typography.

#### 3. How It Was Implemented (Architectural Patterns & Trade-offs)
- **Component Composition Pattern**: `AppTheme` does not hardcode styles; it delegates to specialized config classes.
- **Strict User Directives Honored**: Font family is strictly Poppins and body text scale is strictly 12sp.
- **Automated Test Isolation**: Font fetching is decoupled in widget tests (`testWidgets`), ensuring lightning-fast offline test execution.

---

### Phase 14: Presentation Layer Purity & Strict SOLID/Clean-Architecture Audit

#### 1. What Was Built & Refactored
- **Purification of `SplashController` ([`lib/features/splash/presentation/controllers/splash_controller.dart`](lib/features/splash/presentation/controllers/splash_controller.dart))**:
  - Completely stripped out unnecessary `Equatable` imports and artificial `SplashState` wrappers from the presentation controller.
  - Restored `SplashController` to its pure, idiomatic Riverpod `AsyncNotifier` signature (`AsyncNotifier<MobileConfigEntity>`).
  - Restored domain use case constructor injection (`ref.read(getMobileConfigUseCaseProvider)`).
  - Maintained declarative pattern matching (`.when(data, loading, error)`) in [`SplashScreen`](lib/features/splash/presentation/screens/splash_screen.dart).
- **Streamlined Data Layer ([`lib/features/splash/data/datasources/splash_remote_data_source.dart`](lib/features/splash/data/datasources/splash_remote_data_source.dart))**:
  - Eliminated intermediate `SplashRestClient` wrapper. `SplashRemoteDataSource` is the direct declarative Retrofit REST interface.
- **Exhaustive Architectural Audit across the Codebase**:
  - Verified that `Equatable` is **strictly confined** to Domain Entities (`UserEntity`, `RoleEntity`, `HealthEntity`, `MobileConfigEntity`), Domain Parameters (`RegisterParams`), and Core Failures (`Failure`).
  - Verified zero UI leaks, zero data-serialization logic in the Domain layer, and zero business logic inside UI widgets.

#### 2. Why It Was Built (The Problem It Solves)
- In Clean Architecture, presentation controllers should manage view state directly using the framework's native primitives (Riverpod's `AsyncValue<T>`).
- Injecting `Equatable` into presentation controllers to build synthetic state wrappers creates redundant boilerplate and violates the **Single Responsibility Principle (SRP)** by mixing value-equality paradigms into reactive notifier logic.
- Riverpod's `AsyncValue` already provides out-of-the-box loading, error, data transitions, and identity checking without needing extra state classes.

#### 3. How It Was Implemented (Architectural Patterns & Trade-offs)
- **Zero Equatable in Presentation**: Audited the entire codebase to guarantee no presentation controller imports `package:equatable/equatable.dart`.
- **Clean DTO to Entity Mapping**: Data models remain immutable Freezed classes with `toEntity()` mappers, keeping the Domain layer completely decoupled from external network JSON schemas.
- **Automated Verification**:
  - `flutter analyze` completed with **0 warnings and 0 errors** (`No issues found!`).
  - `flutter test` executed all test suites with **100% pass rate**.

---

### Phase 15: Executive UI Minimalism & Widget Decomposition

#### 1. What Was Built & Refactored
- **Atomic Widget Extraction ([`lib/features/splash/presentation/widgets/splash_brand_header.dart`](lib/features/splash/presentation/widgets/splash_brand_header.dart))**:
  - Extracted the brand logo, name, and tagline animations into an isolated `SplashBrandHeader` widget.
  - Extracted sign-in footer navigation into [`RegisterFooter`](lib/features/auth/presentation/widgets/register_footer.dart).
  - Completely purged private `_buildSomething()` helper methods from [`SplashScreen`](lib/features/splash/presentation/screens/splash_screen.dart) and [`RegisterScreen`](lib/features/auth/presentation/screens/register_screen.dart).
- **Elimination of Debug Metadata Clutter**:
  - Purged all technical debug tags (`App`, `Env`, `Status`, `Ready • v1.2.0`, `Clean Architecture footer`) from the Splash screen UI.
  - Refactored [`SplashSuccessView`](lib/features/splash/presentation/widgets/splash_success_view.dart) and [`SplashLoadingView`](lib/features/splash/presentation/widgets/splash_loading_view.dart) to show a clean, high-fidelity spinner until automatic transition to `/register`.
- **Dynamic Network Error Telemetry**:
  - Refactored [`DioErrorHandler`](lib/core/network/dio_error_handler.dart) to extract the actual destination host & port dynamically (`${uri.host}:${uri.port}`) rather than hardcoding static fallback strings.

#### 2. Why It Was Built (The Problem It Solves)
- Production mobile apps should never display raw backend metadata (such as backend app name, environment name, or database health status) on public screens.
- Inline helper methods (`_buildBrandHeader`, `_buildFooter`) prevent Flutter from performing sub-tree diffing and `const` constructor caching. Extracting them into distinct `StatelessWidget` classes ensures maximum rendering performance and strict **Single Responsibility**.

#### 3. How It Was Implemented
- **Pure Declarative UI**: Screen files are reduced to pure, single-responsibility scaffolds under 75 lines.
- **Verification**: `flutter analyze` verified **0 issues** and `flutter test` passed all 7 tests.

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
