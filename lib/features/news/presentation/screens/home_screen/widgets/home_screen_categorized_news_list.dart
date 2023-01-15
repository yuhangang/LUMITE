import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/news/presentation/provider/news_list_provider.dart";
import "package:lumi_assignment/features/news/presentation/widgets/news_item_widget.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/injection_container.dart";

class HomeScreenCategorizedNewsList extends ConsumerStatefulWidget {
  final NewsCategory category;
  final bool shouldShowWideView;

  const HomeScreenCategorizedNewsList({
    super.key,
    required this.category,
    required this.shouldShowWideView,
  });

  @override
  ConsumerState<HomeScreenCategorizedNewsList> createState() =>
      _HomeScreenNewsListState();
}

class _HomeScreenNewsListState
    extends ConsumerState<HomeScreenCategorizedNewsList>
    with AutomaticKeepAliveClientMixin {
  late final StateNotifierProvider<NewsListStateNotifier,
      AsyncValue<List<News>>> newsListProvider;

  @override
  void initState() {
    newsListProvider =
        StateNotifierProvider<NewsListStateNotifier, AsyncValue<List<News>>>(
            (ref) {
      return NewsListStateNotifier(ref, widget.category.id);
    });
    ref.read(newsListProvider.notifier).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsListState = ref.watch(newsListProvider);
    return newsListState.when(
        data: (newsList) => SliverPadding(
              padding: EdgeInsets.only(
                  top: 16,
                  bottom: 50 + MediaQuery.of(context).padding.bottom,
                  left: 16,
                  right: 16),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final news = newsList[index];
                  return Column(
                    children: [
                      NewsItemWidget(
                        title: news.newsTitle,
                        publisherName: news.publisherName,
                        imageUrl: news.imageUrl,
                        publisherIcon: news.publisherImageUrl,
                        updatedTime: news.updated,
                        wideView: widget.shouldShowWideView,
                        onTap: () {
                          sl.get<Coordinator>().navigateToNewsDetailScreen(
                              news, widget.category);
                        },
                      ),
                      if (index < newsList.length - 1) const Divider()
                    ],
                  );
                },
                childCount: newsList.length,
              )),
            ),
        loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
        error: (obj, stackTrace) => SliverFillRemaining(
              child: RefreshIndicator(
                  onRefresh: () async {
                    return await ref.read(newsListProvider.notifier).load();
                  },
                  child: const Center(child: Text("Something wrong"))),
            ));
  }

  @override
  bool get wantKeepAlive => true;
}
