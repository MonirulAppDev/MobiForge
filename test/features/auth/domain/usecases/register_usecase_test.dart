import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobiforge/features/auth/domain/entities/register_params.dart';
import 'package:mobiforge/features/auth/domain/entities/role_entity.dart';
import 'package:mobiforge/features/auth/domain/entities/user_entity.dart';
import 'package:mobiforge/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobiforge/features/auth/domain/usecases/register_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late RegisterUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = RegisterUseCase(mockRepository);
  });

  const tParams = RegisterParams(
    email: 'flutter_dev@lab.local',
    password: 'Dev@123456',
    fullName: 'Flutter Engineer',
    phone: '+8801811223344',
  );

  final tUser = UserEntity(
    id: 4,
    email: 'flutter_dev@lab.local',
    phone: '+8801811223344',
    fullName: 'Flutter Engineer',
    roleId: 4,
    role: const RoleEntity(
      id: 4,
      name: 'User',
      description: 'Standard mobile user account',
    ),
    isActive: true,
    language: 'en',
    timezone: 'UTC',
    country: 'BD',
  );

  test('should call repository.register and return UserEntity on success', () async {
    when(() => mockRepository.register(tParams))
        .thenAnswer((_) async => Right(tUser));

    final result = await useCase(tParams);

    expect(result, Right(tUser));
    verify(() => mockRepository.register(tParams)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
