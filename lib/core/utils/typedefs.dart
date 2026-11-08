import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Shorthand for functions returning Either a Failure or Success value asynchronously.
///
/// Example:
/// Instead of writing:
/// `Future<Either<Failure, List<Product>>> getProducts();`
///
/// We write:
/// `ResultFuture<List<Product>> getProducts();`
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// Shorthand for operations that return nothing on success (e.g., logout, delete item).
typedef ResultVoid = Future<Either<Failure, void>>;

/// Shorthand for JSON Map structure.
typedef DataMap = Map<String, dynamic>;
