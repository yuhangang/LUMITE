import "package:flutter/material.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";

abstract class Coordinator {
  void navigateToTopicsSettingScreen(BuildContext context);
  void navigateToDisplaySettingScreen(BuildContext context);
  void navigateToStatsticsSettingScreen(BuildContext context);
  void navigateToNewsDetailScreen(
      BuildContext context, News news, NewsCategory category);
}
