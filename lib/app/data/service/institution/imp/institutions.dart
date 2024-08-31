import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exception/exception.dart';
import '../../../../network/dio/dio.client.dart';
import '../institution.dart';

class Institutions extends Institution {

  @override
  Future<Either<Failure, Response>> getInstitutions() async {
    
    var response = await DioClient().get('/institutions');

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