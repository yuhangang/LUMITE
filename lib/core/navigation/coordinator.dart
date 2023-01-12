import "package:lumi_assignment/features/news/data/model/news.dart";

abstract class Coordinator {
  void navigateToTopicsSettingScreen();
  void navigateToDisplaySettingScreen();
  void navigateToStatsticsSettingScreen();
  void navigateToNewsDetailScreen(News news);
}
