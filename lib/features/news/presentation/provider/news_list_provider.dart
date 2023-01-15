import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/news/data/repo/news_repository.dart";

class NewsListStateNotifier extends StateNotifier<AsyncValue<List<News>>> {
  final String category;
  NewsListStateNotifier(this.ref, this.category) : super(const AsyncLoading()) {
    load();
  }

  final Ref ref;

  Future<void> load({bool isRefresh = false}) async {
    if (isRefresh && state is! AsyncError) {
      state = const AsyncLoading();
    }
    final repo = ref.read(newsRepositoryProvider);
    state = (await repo.getNewsByCategory(category)).fold(
        (exception) => AsyncValue.error(exception, StackTrace.current),
        (newsList) => AsyncData(newsList));
  }
}
