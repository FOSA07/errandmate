import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:errandmate/app/network/dio/dio.client.dart';

import '../../../../core/exception/exception.dart';
import '../errands.dart';

class GetErrandsService implements Errands{

  @override
  Future<Either<Failure, Response>> getAvailableErrands(String taskType) async {
    
    var response = await DioClient().get('/errands/tasks?type=$taskType');

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