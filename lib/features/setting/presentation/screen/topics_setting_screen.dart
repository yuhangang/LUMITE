import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:lumi_assignment/core/commons/constant.dart";
import "package:lumi_assignment/core/presentation/widgets/overlay_state_mixin.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";
import "package:lumi_assignment/features/setting/presentation/provider/news_categories_setting_provider.dart";
import "package:lumi_assignment/features/setting/presentation/widgets/setting_screen_template.dart";
import "package:lumi_assignment/features/setting/presentation/widgets/topic_selection_tile.dart";

class TopicsSettingScreen extends ConsumerStatefulWidget {
  const TopicsSettingScreen({super.key});

  @override
  ConsumerState<TopicsSettingScreen> createState() =>
      _TopicsSettingScreenState();
}

class _TopicsSettingScreenState extends ConsumerState<TopicsSettingScreen>
    with OverlayStateMixin {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(newsCategorySettingsProvider);
    return WillPopScope(
      onWillPop: () async {
        if (isOverlayShown) {
          removeOverlay();
        }
        return true;
      },
      child: categories.when(
          data: (categories) => SettingScreenTemplate(
              title: "Topics",
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5,
                shrinkWrap: true,
                children: AppConfig.newsCategoryOptions
                    .where((element) => element.optional)
                    .map((e) {
                  final isSelected = categories.contains(e);
                  return TopicSelectionTile(
                    isSelected: isSelected,
                    title: "${e.displayText} ${e.emoji}",
                    onTap: () {
                      if (isSelected) {
                        ref
                            .read(newsCategorySettingsProvider.notifier)
                            .removeUserNewsCategory(e,
                                onSuccess: () => _showActionSuccessSnackbar(
                                    context,
                                    category: e,
                                    isAdd: false));
                      } else {
                        ref
                            .read(newsCategorySettingsProvider.notifier)
                            .addUserNewsCategory(e,
                                onSuccess: () => _showActionSuccessSnackbar(
                                    context,
                                    category: e,
                                    isAdd: true));
                      }
                    },
                  );
                }).toList(),
              )),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (obj, stackTrace) =>
              const Center(child: CircularProgressIndicator())),
    );
  }

  void _showActionSuccessSnackbar(BuildContext context,
      {required bool isAdd, required NewsCategory category}) {
    insertOverlay(context,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: const BorderRadius.all(Radius.circular(100))),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "${isAdd ? "Followed" : "Unfollowed"} ${category.displayText}  ${category.emoji}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.white),
            )),
        duration: const Duration(seconds: 3));
  }
}
