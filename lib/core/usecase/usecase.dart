import 'package:equatable/equatable.dart';
import '../utils/typedefs.dart';

/// Base contract for UseCases that require input parameters.
///
/// [Type]: The expected return data type (e.g., UserEntity).
/// [Params]: The input parameter object (e.g., LoginParams).
abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();

  ResultFuture<Type> call(Params params);
}

/// Base contract for UseCases that do NOT require any parameters.
///
/// [Type]: The expected return data type (e.g., List<ProductEntity>).
abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}

/// Helper class for cases where an empty parameter is needed.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
