import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:errandmate/app/model/user/profile.dart';
import 'package:errandmate/app/model/user/user.dart';
import 'package:flutterwave_standard_smart/flutterwave.dart';

import '../../../core/exception/exception.dart';

abstract class Wallet {

  Future<Either<Failure, Response>> initializePayment(
    String amount
  ) => throw UnimplementedError();

  Future<Either<Failure, Response>> validatePayment(
    String ref
  ) => throw UnimplementedError();

  Future<Either<Failure, ChargeResponse>> makePayment(
  {
    required String amount,
    required String id,
    required UserProfileModel userData,
  }
  ) => throw UnimplementedError();
  
}