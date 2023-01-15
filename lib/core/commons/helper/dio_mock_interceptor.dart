import "package:dio/dio.dart";
import "package:flutter/services.dart";

class DioMockInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final path = options.path;
    if (path.startsWith("https://api.luminews.my/dummy_news/")) {
      try {
        await Future.delayed(const Duration(milliseconds: 300));
        final category = path.split("/").last;
        final mockData =
            await rootBundle.loadString("assets/mock_data/news/$category.json");
        final mockResponse = Response(data: mockData, requestOptions: options);
        handler.resolve(mockResponse);
      } catch (e) {
        super.onRequest(options, handler);
      }
    } else {
      super.onRequest(options, handler);
    }
  }
}
