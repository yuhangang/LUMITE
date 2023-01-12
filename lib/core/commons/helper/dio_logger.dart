import "dart:developer";
import "package:dio/dio.dart";

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("--> ${options.method} ${options.path}");
    log("Headers: ${options.headers}");
    log("Body: ${options.data}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("<-- ${response.statusCode} ${response.requestOptions.uri} ${response.requestOptions.method}");
    log("Headers: ${response.headers}");
    log("Body: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("<-- ${err.message}");
    super.onError(err, handler);
  }
}
