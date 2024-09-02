import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../model/user/user.dart';
import '../../../utils/serviceLocator/service.locator.dart';
import '../../repository/user.storage.dart';

class UserStorageController {

  SecureStorageService _secureStorageService;

  static UserStorageController? _userStorageController;

  UserStorageController._() : _secureStorageService = locator<SecureStorageService>();

  factory UserStorageController() => _userStorageController ??= UserStorageController._();

  Future<Either<Failure, UserModel>> saveUser(UserModel user) {
    return _secureStorageService.saveUser(user);
  }

  Future<Either<Failure, UserModel?>> getUser() async {
    return await _secureStorageService.getUser();
  }

  Future<Either<Failure, bool>> isCurrentUser() async {
    return await _secureStorageService.isCurrentUser();
  }

  Future<bool> deleteUser() async {
    return await _secureStorageService.deleteUser();
  }

}