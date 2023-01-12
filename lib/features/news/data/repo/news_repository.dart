import "package:dartz/dartz.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:lumi_assignment/features/news/data/data_source/news_data_source.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/injection_container.dart";

final newsRepositoryProvider =
    Provider<NewsRepository>((ref) => sl.get<NewsRepository>());

abstract class NewsRepository {
  Future<Either<Exception, List<News>>> getNewsByCategory(String category);
}

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource newsDataSource;

  NewsRepositoryImpl({
    required this.newsDataSource,
  });

  @override
  Future<Either<Exception, List<News>>> getNewsByCategory(
      String category) async {
    try {
      return Right(await newsDataSource.getNewsByCategory(category));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
