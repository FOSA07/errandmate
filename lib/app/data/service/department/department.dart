import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/exception/exception.dart';
import '../../../network/dio/dio.client.dart';
import '../institution/institution.dart';

class Departments extends Institution {

  @override
  Future<Either<Failure, Response>> getDepartment(
    {
      required String instId,
      required String facId
    }
  ) async {
    var response = await DioClient().get('/institutions/$instId/faculty/$facId/departments');

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (result) {
        try{
          return Right(result);
        }catch (e) {
          return Left(Failure("An error occured", exception: e));
        }
        
      }
    );
    
  }
}