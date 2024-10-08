import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../model/authentication/login.dart';
import '../../../model/user/user.dart';
import '../../../utils/serviceLocator/service.locator.dart';
import '../../service/authentication/authentication.dart';

class LoginUserController {
  static LoginUserController? _instance;

  LoginUserController._();

  factory LoginUserController() => _instance ??= LoginUserController._();

  Future<Either<Failure, UserModel>> login(
      {required UserLoginModel userModel}) async {
    final loginService = locator<Authentication>(instanceName: "LoginService");

    final response = await loginService.loginUser(userModel: userModel);

    // log('response = $response');

    return response.fold(
      (failure) => Left(failure),
      (success) {
        log('success.data["data"] = ${success.data["data"]}');
        return Right(UserModel.fromJson(success.data["data"]));
      },
    );
  }
}
