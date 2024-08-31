import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/exception/exception.dart';
import '../../../model/authentication/create.user.dart';
import '../../../model/authentication/login.dart';

abstract class Authentication {

  Future<Either<Failure, Response>> createUser ({
      required CreateUserModel userModel,
    }) => throw UnimplementedError();

  Future<Either<Failure, Response>> loginUser ({
      required UserLoginModel userModel,
    }) => throw UnimplementedError();

  Future<Either<Failure, Response>> sendOTP ({
      required String tkn,
    }) => throw UnimplementedError();

  Future<Either<Failure, Response>> verifyOTP ({
      required String tkn,
      required String uid,
      required String code
    }) => throw UnimplementedError();

}