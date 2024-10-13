import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/exception/exception.dart';

abstract class Errands {

  Future<Either<Failure, Response>> getAvailableErrands(
    String taskType
  ) => throw UnimplementedError();

  Future<Either<Failure, Response>> createErrandTask(
    String errandType,
    Map<String, dynamic> requestMap
  ) => throw UnimplementedError();
}