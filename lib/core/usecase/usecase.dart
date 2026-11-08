import 'package:equatable/equatable.dart';
import '../utils/typedefs.dart';

/// Base contract for UseCases that require input parameters.
///
/// [T]: The expected return data type (e.g., `UserEntity`).
/// [Params]: The input parameter object (e.g., `LoginParams`).
abstract class UseCaseWithParams<T, Params> {
  const UseCaseWithParams();

  ResultFuture<T> call(Params params);
}

/// Base contract for UseCases that do NOT require any parameters.
///
/// [T]: The expected return data type (e.g., `List<ProductEntity>`).
abstract class UseCaseWithoutParams<T> {
  const UseCaseWithoutParams();

  ResultFuture<T> call();
}

/// Helper class for cases where an empty parameter is needed.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
