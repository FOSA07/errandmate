
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/exception/exception.dart';

abstract class User {

  Future<Either<Failure, Response>> getProfile() => throw UnimplementedError();
  

}