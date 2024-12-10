import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:errandmate/app/model/user/profile.dart';
import 'package:errandmate/app/model/user/user.dart';
import 'package:flutterwave_standard_smart/flutterwave.dart';

import '../../../core/exception/exception.dart';
import '../../../utils/serviceLocator/service.locator.dart';
import '../../service/wallet/wallet.dart';

class DepositController {
  static DepositController? _instance;

  DepositController._();

  factory DepositController() => _instance ??= DepositController._();

  final depositService = locator<Wallet>(instanceName: "DepositService");

  Future<Either<Failure, Response>> initializePayment(
      {required String amount}) async {
    final response = await depositService.initializePayment(amount);

    return response.fold(
        (failure) => Left(failure), (success) => Right(success));
  }

  Future<Either<Failure, ChargeResponse>> makePayment({
    required String amount,
    required String id,
    required UserProfileModel userData,
  }) async {
    final response = await depositService.makePayment(
      amount: amount,
      id: id,
      userData: userData,
    );

    return response.fold(
        (failure) => Left(failure), (success) => Right(success));
  }

  Future<Either<Failure, Response>> validatePayment(String ref) async {
    final response = await depositService.validatePayment(ref);

    return response.fold(
        (failure) => Left(failure), (success) => Right(success));
  }
}
