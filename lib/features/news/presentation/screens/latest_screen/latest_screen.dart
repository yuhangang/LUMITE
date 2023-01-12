import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/features/news/presentation/provider/home_tab_greeting_text_provider.dart";
import "package:lumi_assignment/features/news/presentation/widgets/sticky_header.dart";
import "package:visibility_detector/visibility_detector.dart";

import "package:lumi_assignment/core/commons/helper/url_launch_helper.dart";
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/features/news/presentation/provider/news_list_provider.dart";
import "package:lumi_assignment/features/news/presentation/widgets/category_tab_bar.dart";
import "package:lumi_assignment/features/news/presentation/widgets/news_item.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/features/setting/presentation/provider/display_setting_provider.dart";
import "package:lumi_assignment/features/setting/presentation/provider/news_categories_setting_provider.dart";
import "package:lumi_assignment/injection_container.dart";

class LatestScreen extends ConsumerStatefulWidget {
  const LatestScreen({super.key});

  @override
  ConsumerState<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends ConsumerState<LatestScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  TabController? _categoryTabController;
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<int> _currenTabIndex = ValueNotifier(0);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Perform actions based on the current state
    switch (state) {
      case AppLifecycleState.resumed:
        ref.invalidate(homeTabGreetingTextProvider);
        break;
      case AppLifecycleState.inactive:
        //print("App inactive");
        break;
      case AppLifecycleState.paused:
        //print("App paused");
        break;
      case AppLifecycleState.detached:
        //print("App detached");
        break;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(newsCategorySettingsProvider);
    final shouldShowWideView = ref.watch(displaySettingProvider);
    final greetingText = ref.watch(homeTabGreetingTextProvider);
    return categories.when(
        data: (categoryList) {
          _initTabController(categoryList);
          return NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: RewardsStickyHeaderWidgetDelegate(
                      minExtentWidget: 0,
                      maxExtentWidget: 170,
                      stickyWidgetHeight: 60,
                      stickyWidget: Align(
                        alignment: Alignment.centerLeft,
                        child: CategoryTabBarWidget(
                            categoryTabController: _categoryTabController,
                            scrollController: _scrollController,
                            categories:
                                categoryList.map((e) => e.displayText).toList(),
                            onChangeCategory: (index) {},
                            currenTabIndex: _currenTabIndex),
                      ),
                      carrousselWidget: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              greetingText.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(height: 1.4),
                            ),
                            Text(greetingText.subtitle ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: Colors.grey.shade500)),
                          ],
                        ),
                      ),
                    )),
                /*
                SliverAppBar(
                  pinned: true,
                  floating:true,
                  stretch: true,
                  expandedHeight: 150,
                  collapsedHeight:70,
                  toolbarHeight: 70,
                  flexibleSpace: const FlexibleSpaceBar(
                    stretchModes: [StretchMode.fadeTitle],
                      centerTitle: true,
                      title: Text("Collapsing Toolbar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ))),

                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CategoryTabBarWidget(
                          categoryTabController: _categoryTabController,
                          scrollController: _scrollController,
                          categories:
                              categoryList.map((e) => e.displayText).toList(),
                          onChangeCategory: (index) {},
                          currenTabIndex: _currenTabIndex),
                    ),
                  ),
                  //collapsedHeight: 100,
                ),
                */
              ];
            },
            body: TabBarView(
                controller: _categoryTabController,
                children: categoryList
                    .map((e) => _buildNewsList(e, shouldShowWideView))
                    .toList()),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (obj, stackTrace) =>
            const Center(child: CircularProgressIndicator()));
  }

  Widget _buildNewsList(NewsCategory category, bool shouldShowWideView) {
    if (category.id == "covid") {
      return VisibilityDetector(
          key: Key(category.id),
          child: NewsList(
            shouldShowWideView: shouldShowWideView,
          ),
          onVisibilityChanged: (info) {
            if (info.visibleFraction == 1) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  width: 14 * 12 + 38,
                  content: GestureDetector(
                    onTap: () =>
                        UrlLaunchHelper.launchUrl("https://google.com"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.mail),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Share Statistics")
                      ],
                    ),
                  )));
            } else if (info.visibleFraction == 0) {
              ScaffoldMessenger.of(context).clearSnackBars();
            }
          });
    }
    return NewsList(
      shouldShowWideView: shouldShowWideView,
    );
  }

  void _initTabController(List<NewsCategory> categoryList) {
    if (_categoryTabController?.length != categoryList.length) {
      _categoryTabController =
          TabController(length: categoryList.length, vsync: this);
      _categoryTabController?.addListener(() {
        if (_categoryTabController!.index != _currenTabIndex.value) {
          _currenTabIndex.value = _categoryTabController!.index;
        }
      });
    }
  }
}

class NewsList extends ConsumerWidget {
  final bool shouldShowWideView;
  const NewsList({
    super.key,
    required this.shouldShowWideView,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsListState = ref.watch(newsListProvider);
    return newsListState.when(
        data: (newsList) => RefreshIndicator(
              onRefresh: () async {},
              child: ListView.separated(
                  itemCount: newsList.length,
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 40, left: 16, right: 16),
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final news = newsList[index];
                    return NewsItem(
                      title: news.newsTitle,
                      publisherName: news.publisherName,
                      imageUrl: news.imageUrl,
                      publisherIcon: news.publisherImageUrl,
                      updatedTime: news.updated,
                      wideView: shouldShowWideView,
                      onTap: () {
                        sl.get<Coordinator>().navigateToNewsDetailScreen(news);
                      },
                    );
                  }),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (obj, stackTrace) =>
            const Center(child: CircularProgressIndicator()));
  }
}
