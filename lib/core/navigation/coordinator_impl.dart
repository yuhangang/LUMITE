import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:lumi_assignment/core/navigation/app_router.dart";
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/core/navigation/app_path.dart" as app_path;
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";

class CoordinatorImpl implements Coordinator {
  @override
  void navigateToTopicsSettingScreen(BuildContext context) {
    context.push("${app_path.setting}/${app_path.topics_setting}");
  }

  @override
  void navigateToDisplaySettingScreen(BuildContext context) {
    context.push("${app_path.setting}/${app_path.display_setting}");
  }

  @override
  void navigateToStatsticsSettingScreen(BuildContext context) {
    context.push("${app_path.setting}/${app_path.statistics_setting}");
  }

  @override
  void navigateToNewsDetailScreen(
      BuildContext context, News news, NewsCategory category) {
    final encodedNewsId = Uri.encodeFull(news.newsTitle);
    context.pushNamed("news",
        params: {"id": encodedNewsId},
        extra: NewsDetailPageParam(news: news, category: category));
  }
}
