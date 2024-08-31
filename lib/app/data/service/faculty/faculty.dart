import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:errandmate/app/core/exception/exception.dart';

import '../../../network/dio/dio.client.dart';
import '../institution/institution.dart';

class Faculties extends Institution {

  @override
  Future<Either<Failure, Response>> getFaculties(
    {
      required String instId,
      required String facId
    }
  ) async {
    
    var response = await DioClient().get('/institutions/$instId');

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