import "package:dartz/dartz.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/core/commons/constant.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:shared_preferences/shared_preferences.dart";

final settingRepositoryProvider =
    Provider<SettingRepository>((ref) => SettingRepositoryImpl());

abstract class SettingRepository {
  Future<Either<Exception, List<NewsCategory>>> getUserNewsCategory(
      {bool isInit = false});
  Future<bool> addUserNewsCategory(NewsCategory category);
  Future<bool> removeUserNewsCategory(NewsCategory category);
  Future<void> setWideViewSetting(bool shouldShowWideView);
  Future<bool> shouldShowWideView();
}

class SettingRepositoryImpl implements SettingRepository {
  @override
  Future<Either<Exception, List<NewsCategory>>> getUserNewsCategory(
      {bool isInit = false}) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final stringList =
          pref.getStringList(AppPreferenceKeys.newsCategorySelections);

      if (stringList != null) {
        return Right(AppConfig.newsCategoryOptions
            .where((element) =>
                !element.optional || stringList.contains(element.id))
            .toList());
      } else {
        await pref.setStringList(
            AppPreferenceKeys.newsCategorySelections,
            AppConfig.newsCategoryOptions
                .where((element) => !element.optional)
                .map((e) => e.id)
                .toList());

        return const Right(AppConfig.newsCategoryOptions);
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<bool> addUserNewsCategory(NewsCategory category) async {
    final pref = await SharedPreferences.getInstance();
    final stringList =
        pref.getStringList(AppPreferenceKeys.newsCategorySelections)?.toSet();

    if (stringList != null) {
      stringList.add(category.id);
      return await pref.setStringList(
          AppPreferenceKeys.newsCategorySelections, stringList.toList());
    } else {
      return await pref.setStringList(
          AppPreferenceKeys.newsCategorySelections, [category.id]);
    }
  }

  @override
  Future<bool> removeUserNewsCategory(NewsCategory category) async {
    final pref = await SharedPreferences.getInstance();
    final stringList =
        pref.getStringList(AppPreferenceKeys.newsCategorySelections);

    if (stringList != null) {
      return await pref.setStringList(AppPreferenceKeys.newsCategorySelections,
          stringList.where((element) => element != category.id).toList());
    }

    return true;
  }

  @override
  Future<void> setWideViewSetting(bool shouldShowWideView) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(
        AppPreferenceKeys.shouldShowWideView, shouldShowWideView);
  }

  @override
  Future<bool> shouldShowWideView() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(AppPreferenceKeys.shouldShowWideView) ?? false;
  }
}
