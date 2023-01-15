import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/features/news/presentation/provider/home_tab_greeting_text_provider.dart";
import "package:lumi_assignment/features/news/presentation/screens/home_screen/widgets/home_screen_categorized_news_list.dart";
import "package:lumi_assignment/features/news/presentation/widgets/category_tab_bar.dart";
import "package:lumi_assignment/features/news/presentation/widgets/custom_sticky_header_delegate.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/features/setting/presentation/provider/display_setting_provider.dart";
import "package:lumi_assignment/features/setting/presentation/provider/news_categories_setting_provider.dart";

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  TabController? _categoryTabController;
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<int> _currenTabIndex = ValueNotifier(0);
  final GlobalKey<NestedScrollViewState> documentsNestedKey = GlobalKey();

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
    return Scaffold(
      body: categories.when(
          data: (categoryList) {
            _initTabController(categoryList);
            return NestedScrollView(
              controller: _scrollController,
              //  floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                final stickyWidgetHeight =
                    46 + (16 * MediaQuery.textScaleFactorOf(context));
                final expandableWidgetHeight =
                    MediaQuery.of(context).padding.top +
                        75 +
                        (60 * MediaQuery.textScaleFactorOf(context));
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: CustomStickyHeaderWidgetDelegate(
                          vsync: this,
                          minExtentWidget: 0,
                          maxExtentWidget: expandableWidgetHeight,
                          stickyWidgetHeight: stickyWidgetHeight,
                          stickyWidget: Align(
                            alignment: Alignment.centerLeft,
                            child: CategoryTabBarWidget(
                                height: stickyWidgetHeight,
                                categoryTabController: _categoryTabController,
                                scrollController: _scrollController,
                                categories: categoryList
                                    .map((e) => "${e.displayText}  ${e.emoji}")
                                    .toList(),
                                onChangeCategory: (index) {},
                                currenTabIndex: _currenTabIndex),
                          ),
                          expandableWidget: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  greetingText.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(height: 1.3),
                                ),
                                Text(greetingText.subtitle ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: Colors.grey.shade500)),
                              ],
                            ),
                          ),
                        )),
                  ),

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
                      .map((e) => Builder(builder: (context) {
                            // final scrollController =
                            //     ScrollController(keepScrollOffset: true);
                            return CustomScrollView(
                              // controller: scrollController
                              //   ..addListener(
                              //     () {
                              //       controllerListener(
                              //         _scrollController,
                              //         scrollController,
                              //       );
                              //     },
                              //   ),
                              key: PageStorageKey<String>(e.id),
                              slivers: [
                                SliverOverlapInjector(
                                    handle: NestedScrollView
                                        .sliverOverlapAbsorberHandleFor(
                                            context)),
                                _buildNewsList(e, shouldShowWideView),
                              ],
                            );
                          }))
                      .toList()),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (obj, stackTrace) =>
              const Center(child: CircularProgressIndicator())),
    );
  }

  void controllerListener(
    ScrollController parent,
    ScrollController child,
  ) {
    final childPX = child.position.pixels;
    final parentPX = parent.position.pixels;
    final parentPXMax = parent.position.maxScrollExtent;

    if (childPX >= 0 && parentPX < parentPXMax) {
      parent.position.moveTo(childPX + parentPX);
    } else {
      final currenParentPos = childPX + parentPX;
      parent.position.moveTo(currenParentPos);
    }
  }

  Widget _buildNewsList(NewsCategory category, bool shouldShowWideView) {
    /*
    if (category.id == "covid") {
      return SliverToBoxAdapter(
        child: VisibilityDetector(
            key: Key(category.id),
            child: HomeScreenNewsList(
              category: category,
              shouldShowWideView: shouldShowWideView,
            ),
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    width: 14 * 12 + 38,
                    content: GestureDetector(
                      onTap: () => UrlLaunchHelper.openUrl(
                          "https://luminews.my/covidtracker"),
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
            }),
      );
    }
    */
    return HomeScreenCategorizedNewsList(
      category: category,
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
