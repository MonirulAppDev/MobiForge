# MobiForge Gemini & Antigravity Agent Configuration

You are working on **MobiForge**, a production-ready Flutter E-Commerce project structured with **Clean Architecture** and **SOLID Principles**.

## Core Directives for this Repository
1. **Architecture Enforcement**:
   - Every new feature must follow: `domain/`, `data/`, and `presentation/`.
   - Never import presentation or data dependencies into the `domain/` layer.
   - Always map errors to `Failure` instances returned as `Either<Failure, T>` using `dartz`.
2. **Tech Stack**:
   - **State**: BLoC (`flutter_bloc`) & Riverpod (`flutter_riverpod`, `riverpod_annotation`).
   - **Network**: `Dio` + `Retrofit` (`retrofit`, `retrofit_generator`).
   - **DI**: `GetIt` (`get_it`) + `Injectable` (`injectable`, `injectable_generator`).
   - **Storage**: `Hive` (`hive_flutter`), `SharedPreferences`, `FlutterSecureStorage`.
   - **Data Classes**: `Freezed` (`freezed`, `freezed_annotation`) & `Equatable`.
   - **Routing**: `GoRouter`.
   - **Diagnostics**: `TalkerFlutter`.
3. **Coding Standards**:
   - Use `package:mobiforge/...` imports for cross-feature dependencies.
   - Verify code with `flutter analyze` after adding or editing files.
   - Run `dart run build_runner build --delete-conflicting-outputs` when modifying generated classes.
