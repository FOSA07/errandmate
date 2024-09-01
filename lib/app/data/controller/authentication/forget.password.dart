import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../model/authentication/login.dart';
import '../../../model/user/user.dart';
import '../../../utils/serviceLocator/service.locator.dart';
import '../../service/authentication/authentication.dart';

class ForgetPasswordController {
  static ForgetPasswordController? _instance;

  ForgetPasswordController._();

  factory ForgetPasswordController() =>
      _instance ??= ForgetPasswordController._();

  Future<Either<Failure, Map<String, dynamic>>> resetPassword({
    required String email,
  }) async {
    final fgtService =
        locator<Authentication>(instanceName: "ForgetPasswordService");
    final response = await fgtService.forgetPassword(email: email);

    // log('response = $response');

    return response.fold(
      (failure) => Left(failure),
      (success) {
        return Right(success.data as Map<String, dynamic>);
      },
    );
  }
}
