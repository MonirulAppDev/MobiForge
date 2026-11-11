import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobiforge/features/splash/domain/entities/health_entity.dart';
import 'package:mobiforge/features/splash/domain/repositories/splash_repository.dart';
import 'package:mobiforge/features/splash/domain/usecases/check_server_health_usecase.dart';

class MockSplashRepository extends Mock implements SplashRepository {}

void main() {
  late CheckServerHealthUseCase useCase;
  late MockSplashRepository mockRepository;

  setUp(() {
    mockRepository = MockSplashRepository();
    useCase = CheckServerHealthUseCase(mockRepository);
  });

  const tHealth = HealthEntity(
    app: 'Mobile Backend Lab',
    environment: 'development',
    status: 'ok',
    time: '2026-11-11T06:41:47Z',
  );

  test('should call repository.checkServerHealth and return HealthEntity on success', () async {
    when(() => mockRepository.checkServerHealth())
        .thenAnswer((_) async => const Right(tHealth));

    final result = await useCase();

    expect(result, const Right(tHealth));
    verify(() => mockRepository.checkServerHealth()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
