# MobiForge - AI Agent Engineering Guidelines & Rules

## Project Architecture Overview
MobiForge is an enterprise-grade Flutter E-Commerce application architected with **Clean Architecture** and **SOLID Principles** using a **Feature-First** structure.

All AI agents (Antigravity, Cursor, Copilot, Windsurf) working on this repository **MUST** strictly adhere to the following rules and patterns.

---

## 0. Proactive Senior Architecture & System Design Rule (MANDATORY)

- **Recommend Best Practices First**: The agent MUST act as a proactive Principal Software Architect. NEVER take naive shortcuts (like hardcoding base URLs, omitting environment configs, skipping security layers, or bypassing design patterns).
- **Advisory Protocol**: Always evaluate and propose the most advanced, enterprise-grade system design approach (e.g. `dotenv` / environment separation, multi-flavor configs, network security, interceptors) **BEFORE** proceeding to code implementation.
- **Explain Trade-offs**: Explain *why* the recommended approach is superior, outline the exact single-step roadmap, get user alignment, and then implement one atomic step at a time.

---

## 1. Clean Architecture Layer Isolation Rules

Every feature inside `lib/features/<feature_name>/` MUST contain three distinct layers:

### A. Domain Layer (`domain/`)
- **Entities (`entities/`)**: Pure business objects. MUST extend `Equatable` or be pure Dart classes. **NEVER** import Flutter UI packages (`flutter/material.dart`, widgets) or data parsing logic (`toJson`/`fromJson`) in domain entities.
- **Repository Contracts (`repositories/`)**: Abstract interfaces defining operations. Return `ResultFuture<T>` (which is `Future<Either<Failure, T>>`).
- **Use Cases (`usecases/`)**: Encapsulate a single business operation. MUST extend `UseCaseWithParams<Type, Params>` or `UseCaseWithoutParams<Type>`. Must have a single `call()` method.

### B. Data Layer (`data/`)
- **Models / DTOs (`models/`)**: Data Transfer Objects extending Domain Entities or built with `freezed` + `json_serializable`. Handle `fromJson` and `toJson`.
- **Data Sources (`datasources/`)**:
  - `remote/`: API interaction via `Dio` / `Retrofit` (`@RestApi`).
  - `local/`: Local caching via `Hive` / `SharedPreferences` / `FlutterSecureStorage`.
- **Repository Implementations (`repositories/`)**: Implement Domain repository interfaces. Catch all low-level exceptions (`ServerException`, `CacheException`) and return `Left(Failure)` or `Right(Data)`. Never let exceptions leak to presentation.

### C. Presentation Layer (`presentation/`)
- **State Management**: Use `Bloc` (or `Riverpod` providers where specified).
  - Blocs MUST receive UseCases via constructor injection (never call repositories directly from presentation).
  - State classes MUST be immutable and extend `Equatable`.
- **Screens (`screens/`)**: Full-screen views handling routing, Scaffold, and high-level BlocBuilders/BlocListeners.
- **Widgets (`widgets/`)**: Small, reusable, atomic UI components. Keep widgets under 150 lines.

---

## 2. SOLID Principles Enforcement

- **S - Single Responsibility Principle**: Each class must have exactly one reason to change. Separate remote data sources from local caching. Separate presentation state logic from UI rendering.
- **O - Open/Closed Principle**: Open for extension, closed for modification. Write interfaces for services, repositories, and use cases.
- **L - Liskov Substitution Principle**: Models (e.g. `ProductModel`) MUST be fully substitutable for Entities (`ProductEntity`). Subclasses must honor base class contracts.
- **I - Interface Segregation Principle**: Avoid fat interfaces. Break down complex repositories or client contracts into fine-grained interfaces.
- **D - Dependency Inversion Principle**: High-level modules (Domain/UseCases) MUST NOT depend on low-level modules (Data/Presentation/Dio/Hive). Both depend on abstractions. Inject all dependencies using `GetIt` (`sl`) and `@injectable`.

---

## 3. Package & Tool Usage Conventions

- **State Management**: `flutter_bloc` / `flutter_riverpod` (with `riverpod_annotation`).
- **Networking**: `dio` with `retrofit` (`@RestApi`, `@GET`, `@POST`) and `pretty_dio_logger`.
- **Dependency Injection**: `get_it` and `injectable`. Register new dependencies in `lib/core/di/injection_container.dart`.
- **Data Immutability & Generation**: `freezed`, `json_annotation`, `equatable`.
- **Local Storage**:
  - Sensitive data (tokens, keys): `flutter_secure_storage`.
  - App state / Preferences: `shared_preferences`.
  - Fast offline cache / Box storage: `hive_flutter`.
- **Navigation**: `go_router` declared in `lib/core/routes/app_router.dart`.
- **Logging**: `talker_flutter` for networking, state transitions, and error logs.
- **UI & Layout**: `flutter_screenutil` for responsiveness, `gap` for spacing, `cached_network_image` for images, `shimmer` for skeleton loading.

---

## 4. Code Quality & Agent Output Rules

1. **Package Imports**: Always use `package:mobiforge/...` imports for cross-feature files to avoid broken relative paths.
2. **Never Break Working Code**: Run `flutter analyze` after making changes. Zero errors, zero warnings.
3. **No Hardcoded Values**: Use `AppColors`, `AppConstants`, and `ApiEndpoints` from `lib/core/constants/`.
4. **Code Generation**: Whenever creating or modifying `@freezed`, `@RestApi`, or `@JsonSerializable` classes, inform the user or run:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
5. **Clean Commits**: Keep changes atomic and well-documented.
