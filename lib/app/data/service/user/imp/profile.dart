import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:errandmate/app/core/exception/exception.dart';

import '../../../../network/dio/dio.client.dart';
import '../user.dart';

class UserProfileService extends User {

  @override
  Future<Either<Failure, Response>> getProfile() async {
    
    var response =
        await DioClient().get('/profile');

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