import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:lumi_assignment/core/commons/constant.dart";
import "package:lumi_assignment/features/setting/presentation/provider/news_categories_setting_provider.dart";
import "package:lumi_assignment/features/setting/presentation/widgets/setting_screen_template.dart";
import "package:lumi_assignment/features/setting/presentation/widgets/topic_selection_tile.dart";

class TopicsSettingScreen extends ConsumerStatefulWidget {
  const TopicsSettingScreen({super.key});

  @override
  ConsumerState<TopicsSettingScreen> createState() =>
      _TopicsSettingScreenState();
}

class _TopicsSettingScreenState extends ConsumerState<TopicsSettingScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(newsCategorySettingsProvider);
    return categories.when(
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
                          .removeUserNewsCategory(e);
                    } else {
                      ref
                          .read(newsCategorySettingsProvider.notifier)
                          .addUserNewsCategory(e);
                    }
                  },
                );
              }).toList(),
            )),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (obj, stackTrace) =>
            const Center(child: CircularProgressIndicator()));
  }
}
