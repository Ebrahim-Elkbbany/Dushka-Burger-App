import 'package:dartz/dartz.dart';
import 'package:dushka_burger/core/failure/failures.dart';

abstract class UseCaseWithParam<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}



