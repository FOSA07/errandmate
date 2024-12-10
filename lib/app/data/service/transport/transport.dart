import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:errandmate/app/core/exception/exception.dart';

abstract class TransaportMode {
  Future<Either<Failure, Response>> getTransaportModes() =>
      throw UnimplementedError();
}
