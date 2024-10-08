import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exception/exception.dart';
import '../../../../model/authentication/create.user.dart';
import '../../../../network/dio/dio.client.dart';
import '../authentication.dart';

class CreateUserAccountService extends Authentication {
  @override
  Future<Either<Failure, Response>> createUser(
      {required CreateUserModel userModel}) async {
    var response = await DioClient().post(
      '/auth/register',
      data: userModel.toJson(),
    );

    log('$response');

    return response.fold((failure) {
      return Left(failure);
    }, (result) {
      try {
        return Right(result);
      } catch (e) {
        return Left(Failure("An error occured", exception: e));
      }
    });
  }
}
