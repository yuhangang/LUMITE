import "package:lumi_assignment/features/setting/data/model/news_category.dart";

abstract class AppConfig {
  static const List<NewsCategory> newsCategoryOptions = [
    NewsCategory(id: "latest", displayText: "Latest  ⚡", optional: false),
    NewsCategory(id: "trending", displayText: "Trending  🔥"),
    NewsCategory(id: "news", displayText: "News  ☕"),
    NewsCategory(id: "covid", displayText: "Covid  🦠"),
    NewsCategory(id: "tech", displayText: "Tech  📱"),
  ];

  final String apiEndPoint = "https://api.luminews.my";
}

abstract class AppPreferenceKeys {
  static const newsCategorySelections = "news_category_selections";
  static const shouldShowWideView = "should_show_wide_view";
}
