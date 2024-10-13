import 'package:dartz/dartz.dart';

import 'package:dio/src/response.dart';

import 'package:errandmate/app/core/exception/exception.dart';

import '../../../../network/dio/dio.client.dart';
import '../errands.dart';

class CreateErrandTaskService extends Errands {

  @override
  Future<Either<Failure, Response>> createErrandTask(String errandType, Map<String, dynamic> requestMap) async {
    
    try{
      var response = await DioClient().post(
        '/errands/$errandType',
        data: requestMap,
      );

      return response;

    } catch (e) {
      return Left(Failure("An error occured", exception: e));
    }


  }
}