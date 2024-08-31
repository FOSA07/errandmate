import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/exception/exception.dart';

abstract class Institution {

  Future<Either<Failure, Response>> getInstitutions () => throw UnimplementedError();

  Future<Either<Failure, Response>> getFaculties (
    {
      required String instId,
      required String facId
    }
  ) => throw UnimplementedError("This is causing an error");

  Future<Either<Failure, Response>> getDepartment (
    {
      required String instId,
      required String facId
    }
  ) => throw UnimplementedError();

}