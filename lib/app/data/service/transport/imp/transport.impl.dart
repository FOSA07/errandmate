import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:errandmate/app/data/service/transport/transport.dart';

import '../../../../core/exception/exception.dart';
import '../../../../network/dio/dio.client.dart';

class TransaportModesImpl extends TransaportMode {
  @override
  Future<Either<Failure, Response>> getTransaportModes() async {
    var response = await DioClient().get('/settings/transportation/settings');

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
