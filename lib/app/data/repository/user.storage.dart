import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/exception/exception.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';

  Future<Either<Failure, String>> storeToken(String token) async {
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
      return Right(token);
    } catch (e) {
      return Left(Failure('An error occurred while storing the token.', exception: e));
    }
  }

  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await _secureStorage.read(key: _tokenKey);
      return Right(token);
    } catch (e) {
      return Left(Failure('An error occurred while retrieving the token.', exception: e));
    }
  }

  Future<Either<Failure, bool>> hasToken() async {
    try {
      final token = await _secureStorage.read(key: _tokenKey);
      return Right(token != null);
    } catch (e) {
      return Left(Failure('An error occurred while checking for the token.', exception: e));
    }
  }

  Future<Either<Failure, bool>> deleteToken() async {
    try {
      await _secureStorage.delete(key: _tokenKey);
      return const Right(true);
    } catch (e) {
      return Left(Failure('An error occurred while deleting the token.', exception: e));
    }
  }
}
