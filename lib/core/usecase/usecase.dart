import 'package:dartz/dartz.dart';
import 'package:lawyearn/core/error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}