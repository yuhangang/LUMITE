import "package:go_router/go_router.dart";
import "package:lumi_assignment/core/navigation/app_router.dart";
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/core/navigation/app_path.dart" as app_path;
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/injection_container.dart";

class CoordinatorImpl implements Coordinator {
  @override
  void navigateToTopicsSettingScreen() {
    sl.get<GoRouter>().push(app_path.topics_setting);
  }

  @override
  void navigateToDisplaySettingScreen() {
    sl.get<GoRouter>().push(app_path.display_setting);
  }

  @override
  void navigateToStatsticsSettingScreen() {
    sl.get<GoRouter>().push(app_path.statistics_setting);
  }

  @override
  void navigateToNewsDetailScreen(News news, NewsCategory category) {
    sl.get<GoRouter>().push(app_path.news_detail,
        extra: NewsDetailPageParam(news: news, category: category));
  }
}
