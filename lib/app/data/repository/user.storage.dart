import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import '../../core/exception/exception.dart';
import '../../model/user/user.dart';

class SecureStorageService {

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _userKey = 'user_model';

  Future<Either<Failure, UserModel>> saveUser(UserModel user) async {

    try {
      final userJson = jsonEncode(user.toJson());
      await _secureStorage.write(key: _userKey, value: userJson);

      return Right(user);
    } catch (e) {
      return Left(Failure('An error occured,', exception: e));
    }
    
  }

  Future<Either<Failure, UserModel?>> getUser() async {
    try{
      final userJson = await _secureStorage.read(key: _userKey);
      if (userJson == null) return const Right(null);
      return Right(UserModel.fromJson(jsonDecode(userJson)));
    } catch (e) {
      return Left(Failure('An unknown error occur', exception: e));
    }
    
  }

  Future<Either<Failure, bool>> isCurrentUser() async {
    try {
      final userJson = await _secureStorage.read(key: _userKey);
      if (userJson != null) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(Failure('Failed to check user presence', exception: e));
    }
  }

  Future<bool> deleteUser() async {
    try{
      await _secureStorage.delete(key: _userKey);
      return true;
    } catch (e) {
      return false;
    }
    
  }
}
