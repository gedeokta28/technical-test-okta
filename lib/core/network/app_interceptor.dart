import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // set default headers
    options.headers.addAll({"content-type": "application/json; charset=utf-8"});
    options.headers.addAll({"Accept": "application/json"});

    //check param 'required_token'
    const requiredToken = 'required_token';
    if (options.headers.containsKey(requiredToken)) {
      options.headers.remove(requiredToken);

      String token = '';
      token =
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MDc3MWU5OGFlYmI5ODZiYjBkZDU3ZDhjM2FjNDYyYyIsInN1YiI6IjY1NGQ4Nzk4NWE1ZWQwMDBlM2Y1ZGVjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.djSmZIhn5h-Ypia9i_wQFoLfl-Xv74HhHAtof2A7xAg';
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    return super.onRequest(options, handler);
  }
}
