import "package:dio/dio.dart";

mixin APIExceptionHandlerMixin {
  Exception handleAPIError(dynamic error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          return Exception("Request cancelled");
        case DioErrorType.connectTimeout:
          return Exception("Connection timeout");
        case DioErrorType.other:
          return Exception("Connection error");
        case DioErrorType.receiveTimeout:
          return Exception("Receive timeout");
        case DioErrorType.response:
          return Exception(
              "Failed with status code: ${error.response?.statusCode}");
        case DioErrorType.sendTimeout:
          return Exception("Send timeout");
      }
    } else {
      return Exception("Unexpected error occured: $error");
    }
  }
}
