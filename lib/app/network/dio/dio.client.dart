import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import '../../core/exception/exception.dart';
import '../../core/exception/network/network.exceptions.dart';
import '../../data/controller/storage/user.dart';
import '../config/base.options.dart';
import 'dio.interceptors.dart';

class DioClient {
  late final Dio _dio;
  final UserStorageController _userstorageController = UserStorageController();

  DioClient() {
    _dio = Dio(DioBaseOptions.options);
    _dio.interceptors.add(DioInterceptors(_userstorageController));
  }

  Future<Either<Failure, Response>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      
      final result = await _dio.get(path, queryParameters: queryParameters);
      result.data["code"] ??= "99";
      if (result.statusCode == 200 && result.data["code"] == "00") {
        return Right(result);
      }
      return Left(Failure(result.data["message"] ?? "Response Error"));
    } on DioException catch (e) {
      return Left(NetworkExceptions.handleDioException(e));
      // throw NetworkExceptions.handleDioException(e);
    } catch (e) {
      // return Left(NetworkExceptions.handleDioException(DioException());
      return Left(Failure(e.toString(), exception: e));
    }
  }

  Future<Either<Failure, Response>> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {

      final result =
          await _dio.post(path, data: data, queryParameters: queryParameters);
      // log('result = $result');

      result.data["code"] ??= "99";
      if (result.statusCode == 200 && result.data["code"] == "00") {
        return Right(result);
      }
      return Left(Failure(result.data["message"] ?? "Response Error"));
    } on DioException catch (e) {
      log('error = $e');
      log('Endpoint = ${e.requestOptions.uri.toString()}');
      if (e.response != null) {
        Map? error = e.response?.data["errors"] ??
            e.response?.data["message"] ??
            {
              "name": ["unknown error from server"]
            };
        return Left(Failure(error![error.keys.first][0].toString()));
      }

      return Left(NetworkExceptions.handleDioException(e));
    } catch (e) {
      return Left(Failure(e.toString(), exception: e));
    }
  }

  // Future<Either<String, Response>> delete(
  //   String path, {
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   try {
  //     return Right(await _dio.delete(path, queryParameters: queryParameters));
  //   } on DioException catch (e) {
  //     return Left(NetworkExceptions.handleDioException(e));
  //   } catch (e) {
  //     return const Left("a bug");
  //   }
  // }
}
