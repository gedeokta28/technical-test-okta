import 'package:dio/dio.dart';

import '../utils/env.dart';
import 'app_interceptor.dart';

class DioClient {
  static late Dio _dio;
  final Env env = Env();
  final AppInterceptor appInterceptor = AppInterceptor();

  DioClient({String? base}) {
    _dio = Dio(BaseOptions(
      baseUrl: base ?? env.baseUrl,
      validateStatus: (status) => (status! >= 200) && (status < 400),
    ));
  }

  Dio get dio => _dio;
}
