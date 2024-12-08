import 'package:crypto_tracker/core/data/api/failures/failures.dart';
import 'package:fpdart/fpdart.dart';

typedef Json = Map<String, dynamic>;
typedef FutureFailable<T> = Future<Either<Failure, T>>;
typedef Failable<T> = Either<Failure, T>;