# Flutter Clean Architecture & SOLID Rules

## Directory Structure
```
lib/
├── app.dart
├── main.dart
├── core/
│   ├── constants/
│   ├── di/
│   ├── errors/
│   ├── network/
│   ├── routes/
│   ├── services/
│   ├── theme/
│   ├── usecase/
│   └── utils/
└── features/
    ├── <feature_name>/
    │   ├── data/
    │   │   ├── datasources/
    │   │   ├── models/
    │   │   └── repositories/
    │   ├── domain/
    │   │   ├── entities/
    │   │   ├── repositories/
    │   │   └── usecases/
    │   └── presentation/
    │       ├── bloc/
    │       ├── providers/
    │       ├── screens/
    │       └── widgets/
```

## SOLID Principles in Practice
1. **Single Responsibility Principle (SRP)**:
   - UseCases do one thing and one thing only.
   - RemoteDataSource only talks to the API.
   - LocalDataSource only handles disk/Hive/cache.
2. **Open-Closed Principle (OCP)**:
   - Always define abstract contracts for repositories and data sources.
3. **Liskov Substitution Principle (LSP)**:
   - Models extend Entities and are drop-in replacements.
4. **Interface Segregation Principle (ISP)**:
   - Create focused, minimal interfaces instead of monolithic ones.
5. **Dependency Inversion Principle (DIP)**:
   - High-level domain depends on abstractions, low-level data implements them.
   - Inject dependencies through `GetIt`.
