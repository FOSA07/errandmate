import 'package:dio/dio.dart';


class DioInterceptors extends Interceptor {
  // final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // _logger.i("Request[${options.method}] => PATH: ${options.path}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // _logger.i("Response[${response.statusCode}] => DATA: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // print(err);
    // _logger.e("Error[${err.response?.statusCode}] => MESSAGE: ${err.message}");
    handler.next(err);
  }
}
