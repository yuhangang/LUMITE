import "package:dartz/dartz.dart";
import "package:lumi_assignment/core/navigation/app_router.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";

class StatisticsData {
  final NewsDetailPageParam? lastRead;
  final int numOfNewsReadInOneAppSession;
  final List<NewsCategory> numOfTopicsFollowed;
  final Tuple2<NewsCategory, int>? mostClickTopicsData;

  StatisticsData({
    this.lastRead,
    required this.numOfNewsReadInOneAppSession,
    required this.numOfTopicsFollowed,
    required this.mostClickTopicsData,
  });
}
