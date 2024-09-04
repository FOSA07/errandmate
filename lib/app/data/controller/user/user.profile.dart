import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../model/user/profile.dart';
import '../../../utils/serviceLocator/service.locator.dart';
import '../../service/user/user.dart';

class UserProfileController {

  static UserProfileController? _userProfileController;

  UserProfileController._();

  factory UserProfileController() => _userProfileController ??= UserProfileController._();

  Future<Either<Failure, UserProfileModel>> getUserProfile () async {
    final userService = locator<User>(instanceName: "UserProfile");

    final response = await userService.getProfile();

    return response.fold(
      (failure) => Left(failure),
      (result) => Right(UserProfileModel.fromJson(result.data["data"])),
    );

  }
}