import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/env.dart';
import 'app_interceptor.dart';

class DioClient {
  static late Dio _dio;
  final Env env = Env();
  final AppInterceptor appInterceptor = AppInterceptor();
  addInterception() {
    _dio.interceptors.addAll([
      appInterceptor,
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90)
    ]);
  }

  DioClient({String? base}) {
    _dio = Dio(BaseOptions(
      baseUrl: base ?? env.baseUrl,
      validateStatus: (status) => (status! >= 200) && (status < 400),
    ));
    addInterception();
  }

  Dio get dio => _dio;
}
