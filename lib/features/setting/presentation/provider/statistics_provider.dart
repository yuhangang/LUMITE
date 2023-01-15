import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:dartz/dartz.dart";
import "package:collection/collection.dart";
import "package:lumi_assignment/core/commons/constant.dart";
import "package:lumi_assignment/core/navigation/app_router.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/features/setting/data/model/statistics_data.dart";
import "package:lumi_assignment/features/setting/data/repo/setting_repository.dart";

final statisticsProvider =
    StateNotifierProvider<StatisticsStateNotifier, AsyncValue<StatisticsData>>(
        (ref) {
  return StatisticsStateNotifier(ref);
});

class StatisticsStateNotifier
    extends StateNotifier<AsyncValue<StatisticsData>> {
  StatisticsStateNotifier(this.ref) : super(const AsyncLoading());

  final Ref ref;
  NewsDetailPageParam? lastRead;
  int numOfNewsReadInOneAppSession = 0;
  Map<String, int> topicsReadData = {};

  void onOpenNews(News news, NewsCategory category) {
    lastRead = NewsDetailPageParam(news: news, category: category);
    numOfNewsReadInOneAppSession += 1;
    if (topicsReadData.containsKey(category.id)) {
      topicsReadData[category.id] = topicsReadData[category.id]! + 1;
    } else {
      topicsReadData[category.id] = 1;
    }
  }

  Tuple2<NewsCategory, int>? getMostClickTopics() {
    final topTopics = topicsReadData.entries.fold<MapEntry<String, int>?>(null,
        (curr, next) => curr != null && curr.value > next.value ? curr : next);

    if (topTopics != null) {
      final NewsCategory? category = AppConfig.newsCategoryOptions
          .firstWhereOrNull((e) => e.id == topTopics.key);
      if (category != null) {
        return Tuple2(category, topTopics.value);
      }
    }
    return null;
  }

  void load() async {
    state = const AsyncLoading();
    final settingRepo = ref.read(settingRepositoryProvider);
    final data = await settingRepo.getUserNewsCategory();
    state = data.fold(
        (l) => AsyncError(l, StackTrace.current),
        (r) => AsyncData(StatisticsData(
            numOfTopicsFollowed:
                r.where((element) => element.optional).toList(),
            numOfNewsReadInOneAppSession: numOfNewsReadInOneAppSession,
            mostClickTopicsData: getMostClickTopics(),
            lastRead: lastRead)));
  }
}
