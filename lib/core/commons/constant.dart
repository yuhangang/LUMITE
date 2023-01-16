import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:lumi_assignment/core/navigation/custom_page_transition_builder.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";

abstract class AppConfig {
  static const List<NewsCategory> newsCategoryOptions = [
    NewsCategory(
        id: "latest", displayText: "Latest", emoji: "⚡", optional: false),
    NewsCategory(id: "trending", displayText: "Trending", emoji: "🔥"),
    NewsCategory(
      id: "news",
      displayText: "News",
      emoji: "☕",
    ),
    NewsCategory(id: "covid", displayText: "Covid", emoji: "🦠"),
    NewsCategory(id: "tech", displayText: "Tech", emoji: "📱"),
  ];

  final String apiEndPoint = "https://api.luminews.my";
}

abstract class AppPreferenceKeys {
  static const newsCategorySelections = "news_category_selections";
  static const shouldShowWideView = "should_show_wide_view";
}

ThemeData appTheme(BuildContext context) => ThemeData(
    fontFamily: "Poppins",
    iconTheme: IconThemeData(size: 24 * MediaQuery.textScaleFactorOf(context)),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CustomPageTransitionsBuilder(),
      TargetPlatform.iOS: CustomPageTransitionsBuilder(),
    }),
    dividerTheme: DividerThemeData(
        color: Colors.grey.shade300, thickness: 0.4, space: 32),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade50,
        shadowColor: Colors.grey.shade600.withOpacity(0.1),
        foregroundColor: Colors.blue.shade500,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark)),
    snackBarTheme: const SnackBarThemeData(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
    ),
    colorScheme: ColorScheme(
        primary: Colors.blueAccent.shade700,
        secondary: Colors.blueGrey.shade100,
        brightness: Brightness.light,
        onPrimary: Colors.blueAccent.shade400,
        onSecondary: Colors.blueGrey.shade50,
        error: Colors.red,
        onError: Colors.red.shade300,
        background: Colors.grey.shade100,
        onBackground: Colors.grey.shade50,
        surface: Colors.grey,
        onSurface: Colors.grey.shade300),
    textTheme: TextTheme(
        headline5: const TextStyle(
            fontSize: 26, height: 1.2, fontWeight: FontWeight.w700),
        headline6: const TextStyle(
            fontSize: 20, height: 1.2, fontWeight: FontWeight.w600),
        bodyText1: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        bodyText2: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        subtitle1: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        subtitle2: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w400)));
