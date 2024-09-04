import 'package:dio/dio.dart';

import '../../data/controller/storage/user.dart';
import '../../model/user/user.dart';


class DioInterceptors extends Interceptor {
  // final Logger _logger = Logger();

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   // _logger.i("Request[${options.method}] => PATH: ${options.path}");
  //   super.onRequest(options, handler);
  // }

  final UserStorageController _userStorageController;

  DioInterceptors(this._userStorageController);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_requiresToken(options.path)) {
      final tokenResult = await _userStorageController.getToken();

      tokenResult.fold(
        (failure) => handler.reject(
          DioException(requestOptions: options, error: 'Failed to retrieve token: ${failure.message}'),
        ),
        (token) {
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      );
    } else {

      handler.next(options);
    }
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // _logger.i("Response[${response.statusCode}] => DATA: ${response.data}");
  //   super.onResponse(response, handler);
  // }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.path == '/auth/login' && response.statusCode == 200 && response.data["code"] == "00") {
      final token = UserModel.fromJson(response.data["data"]);
      if (token.token != null) {
        
        final tokenResult = await _userStorageController.storeToken(token.token!.split('|').last);

        tokenResult.fold(
          (failure) {
            handler.reject(DioException(
              requestOptions: response.requestOptions,
              response: response,
              error: Exception('Failed to store token'),
            ));
            return;
          },
          (_) {
          },
        );
      }
    }

    handler.next(response);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // print(err);
    // _logger.e("Error[${err.response?.statusCode}] => MESSAGE: ${err.message}");
    handler.next(err);
  }

  bool _requiresToken(String path) {
    
    const tokenRequiredPaths = [
      '/profile',
      '/tasks',
      '/payments',
      '/errands',
    ];

    return tokenRequiredPaths.any((requiredPath) => path.startsWith(requiredPath));
  }
}
