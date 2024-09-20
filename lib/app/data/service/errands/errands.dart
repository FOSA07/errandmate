import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/exception/exception.dart';

abstract class Errands {

  Future<Either<Failure, Response>> getAvailableErrands(
    String taskType
  ) => throw UnimplementedError();
}