import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/features/setting/data/repo/setting_repository.dart";

final newsCategorySettingsProvider = StateNotifierProvider<
    DisplaySettingNotifier, AsyncValue<List<NewsCategory>>>((ref) {
  return DisplaySettingNotifier(ref);
});

class DisplaySettingNotifier
    extends StateNotifier<AsyncValue<List<NewsCategory>>> {
  DisplaySettingNotifier(this.ref) : super(const AsyncLoading()) {
    load(isInit: true);
  }

  final Ref ref;

  void load({bool isInit = false}) async {
    final repo = ref.read(settingRepositoryProvider);
    state = (await repo.getUserNewsCategory(isInit: isInit)).fold(
        (exception) => AsyncValue.error(exception, StackTrace.current),
        (categoryList) => AsyncData(categoryList));
  }

  void addUserNewsCategory(NewsCategory category,
      {required VoidCallback onSuccess}) async {
    final repo = ref.read(settingRepositoryProvider);
    final isSuccess = await repo.addUserNewsCategory(category);
    if (isSuccess) {
      onSuccess.call();
    }
    load();
    // Counter can use the "ref" to read other providers
  }

  void removeUserNewsCategory(NewsCategory category,
      {required VoidCallback onSuccess}) async {
    final repo = ref.read(settingRepositoryProvider);
    final isSuccess = await repo.removeUserNewsCategory(category);
    if (isSuccess) {
      onSuccess.call();
    }
    load();
    // Counter can use the "ref" to read other providers
  }
}
