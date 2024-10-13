import 'package:dio/dio.dart';

import '../../utils/constant/network/netwrok.constant.dart';

class DioBaseOptions {
  static BaseOptions get options => BaseOptions(
    baseUrl: NetworkConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 100),
    sendTimeout: const Duration(seconds: 10),
    followRedirects: true,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    
  );
}
