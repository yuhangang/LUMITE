import "dart:convert";
import "package:dio/dio.dart";
import "package:lumi_assignment/core/commons/mixin/api_exception_handler_mixin.dart";

import "package:lumi_assignment/features/news/data/model/news.dart";

abstract class NewsDataSource {
  Future<List<News>> getNewsByCategory(String category);
}

class NewsDataSourceImpl
    with APIExceptionHandlerMixin
    implements NewsDataSource {
  final Dio dio;
  NewsDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<News>> getNewsByCategory(String category) async {
    try {
      Response response =
          await dio.get("https://api.luminews.my/dummy_news/$category");
      return (List<Map<String, dynamic>>.from(jsonDecode(response.data)))
          .map((e) => News.fromJson(e))
          .toList();
    } on DioError catch (error) {
      throw handleAPIError(error);
    }
  }
}
