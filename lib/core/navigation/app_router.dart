import "dart:convert";
import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";
import "package:lumi_assignment/core/navigation/app_path.dart" as app_path;
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/features/home/presentation/screens/home_container.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/news/presentation/screens/home_screen/home_screen.dart";
import "package:lumi_assignment/features/news/presentation/screens/news_detail_page/news_detail_screen.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/features/setting/presentation/screen/display_setting_screen.dart";
import "package:lumi_assignment/features/setting/presentation/screen/statistic_setting_screen/satistics_setting_screen.dart";
import "package:lumi_assignment/features/setting/presentation/screen/setting_screen.dart";
import "package:lumi_assignment/features/setting/presentation/screen/topics_setting_screen.dart";
import "package:lumi_assignment/injection_container.dart";

final appRouter = getRouter();

class NewsDetailPageParam {
  final News news;
  final NewsCategory category;
  const NewsDetailPageParam({
    required this.news,
    required this.category,
  });

  String toJson() {
    return jsonEncode({
      "news": news.toJson(),
      "category": category.toJson(),
    });
  }
}

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "shell");

GoRouter getRouter() => GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: app_path.home,
    observers: [RouteObserver<PageRoute>()],
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return HomeContainer(child: child);
          },
          routes: [
            GoRoute(
                path: app_path.home,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  final data = Uri.parse(state.location);
                  String? initialCategory;
                  String? newsId;
                  if (data.queryParameters.containsKey("topic")) {
                    initialCategory = data.queryParameters["topic"];
                  }

                  if (data.queryParameters.containsKey("news_id")) {
                    newsId = data.queryParameters["news_id"];
                  }
                  //if (){}
                  return NoTransitionPage(
                      child: HomeScreen(
                    initialCategory: initialCategory,
                    newsDetailDeeplinkCallback: (news, category) {
                      sl
                          .get<Coordinator>()
                          .navigateToNewsDetailScreen(context, news, category);
                    },
                    newsId: newsId,
                  ));
                },
                routes: [
                  GoRoute(
                      parentNavigatorKey: rootNavigatorKey,
                      path: app_path.news_detail,
                      redirect: (context, state) {
                        if (state.extra != null) {
                          return null;
                        }
                        if (state.params.containsKey("id")) {
                          return "${app_path.home}?news_id=${state.params['id']}";
                        }
                        return app_path.home;
                      },
                      name: "news",
                      builder: (context, state) {
                        final params = state.extra as NewsDetailPageParam;
                        return NewsDetailScreen(
                          news: params.news,
                          category: params.category,
                        );
                      })
                ]),
            GoRoute(
                path: app_path.setting,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: SettingScreen(key: state.pageKey));
                },
                routes: [
                  GoRoute(
                      path: app_path.topics_setting,
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) => const TopicsSettingScreen()),
                  GoRoute(
                      path: app_path.display_setting,
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) =>
                          const DisplaySettingScreen()),
                  GoRoute(
                      path: app_path.statistics_setting,
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) =>
                          const StatisticsSettingScreen()),
                ]),
          ]),
    ]);
