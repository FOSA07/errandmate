import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../utils/serviceLocator/service.locator.dart';
import '../../service/authentication/authentication.dart';

class OTPController {

  static OTPController? _instance;

  OTPController._();

  factory OTPController() => _instance ??= OTPController._();

  Future<Either<Failure, Map>> sendOTP ({required String tkn}) async {

    final sendOTPService = locator<Authentication>(instanceName: "SendOTP");

    final response = await sendOTPService.sendOTP(tkn: tkn);

    return response.fold(
      (failure) => Left(failure),
      (success) => Right(success.data["data"]),
    );
  }

  Future<Either<Failure, Map>> verifyOTP ({required String tkn, required String uid, required String code}) async {

    final sendOTPService = locator<Authentication>(instanceName: "SendOTP");

    final response = await sendOTPService.verifyOTP(tkn: tkn, uid: uid, code: code);

    return response.fold(
      (failure) => Left(failure),
      (success) => Right(success.data["data"]),
    );
  }
}