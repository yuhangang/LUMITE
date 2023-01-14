import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";

abstract class Coordinator {
  void navigateToTopicsSettingScreen();
  void navigateToDisplaySettingScreen();
  void navigateToStatsticsSettingScreen();
  void navigateToNewsDetailScreen(News news, NewsCategory category);
}
