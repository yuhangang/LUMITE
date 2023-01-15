import "package:collection/collection.dart";
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
  final String? newsId;
  final void Function(News, NewsCategory)? newsDetailDeeplinkCallback;

  const HomeScreenCategorizedNewsList({
    super.key,
    required this.category,
    required this.shouldShowWideView,
    this.newsId,
    this.newsDetailDeeplinkCallback,
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

  StateNotifierProvider<NewsListStateNotifier, AsyncValue<List<News>>>?
      subscription;

  @override
  void initState() {
    newsListProvider =
        StateNotifierProvider<NewsListStateNotifier, AsyncValue<List<News>>>(
            (ref) {
      return NewsListStateNotifier(ref, widget.category.id);
    });
    ref.read(newsListProvider.notifier).load();
    ref.read(newsListProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsListState = ref.watch(newsListProvider);
    ref.listen(newsListProvider, (previous, next) {
      if (next is AsyncData) {
        _handleDeepLinkRedirect(next.asData!.value, context);
      }
    });
    return newsListState.when(
        data: (newsList) {
          return SliverPadding(
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
                            context, news, widget.category);
                      },
                    ),
                    if (index < newsList.length - 1) const Divider()
                  ],
                );
              },
              childCount: newsList.length,
            )),
          );
        },
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

  void _handleDeepLinkRedirect(List<News> newsList, BuildContext context) {
    if (widget.newsId != null && widget.newsDetailDeeplinkCallback != null) {
      Future.delayed(Duration.zero, () {
        final newsToRedirect = newsList.firstWhereOrNull((element) {
          return widget.newsId == element.newsTitle;
        });
        if (newsToRedirect != null) {
          widget.newsDetailDeeplinkCallback
              ?.call(newsToRedirect, widget.category);
        }
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
