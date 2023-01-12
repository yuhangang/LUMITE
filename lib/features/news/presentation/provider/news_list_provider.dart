import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/news/data/repo/news_repository.dart";

final newsListProvider =
    StateNotifierProvider<DisplaySettingNotifier, AsyncValue<List<News>>>(
        (ref) {
  return DisplaySettingNotifier(ref, "latest");
});

class DisplaySettingNotifier extends StateNotifier<AsyncValue<List<News>>> {
  final String category;
  DisplaySettingNotifier(this.ref, this.category)
      : super(const AsyncLoading()) {
    load();
  }

  final Ref ref;

  Future<void> load({bool isRefresh = false}) async {
    final repo = ref.read(newsRepositoryProvider);
    state = (await repo.getNewsByCategory(category)).fold(
        (exception) => AsyncValue.error(exception, StackTrace.current),
        (newsList) => AsyncData(newsList));
  }
}
