import "dart:convert";
import "package:go_router/go_router.dart";
import "package:lumi_assignment/core/navigation/app_path.dart" as app_path;
import "package:lumi_assignment/features/home/presentation/screens/home_container.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/news/presentation/screens/news_detail_page/news_detail_screen.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/features/setting/presentation/screen/display_setting_screen.dart";
import "package:lumi_assignment/features/setting/presentation/screen/satistics_setting_screen.dart";
import "package:lumi_assignment/features/setting/presentation/screen/topics_setting_screen.dart";

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

GoRouter getRouter() => GoRouter(routes: [
      GoRoute(
          path: app_path.home,
          builder: (context, state) => const HomeContainer()),
      GoRoute(
          path: app_path.topics_setting,
          builder: (context, state) => const TopicsSettingScreen()),
      GoRoute(
          path: app_path.display_setting,
          builder: (context, state) => const DisplaySettingScreen()),
      GoRoute(
          path: app_path.statistics_setting,
          builder: (context, state) => const StatisticsSettingScreen()),
      GoRoute(
          path: app_path.news_detail,
          builder: (context, state) {
            final params = state.extra as NewsDetailPageParam;
            return NewsDetailScreen(
              news: params.news,
              category: params.category,
            );
          })
    ]);
