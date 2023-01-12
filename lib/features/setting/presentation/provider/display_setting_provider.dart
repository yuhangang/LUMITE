import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/features/setting/data/repo/setting_repository.dart";

final displaySettingProvider =
    StateNotifierProvider<DisplaySettingNotifier, bool>((ref) {
  return DisplaySettingNotifier(ref);
});

class DisplaySettingNotifier extends StateNotifier<bool> {
  DisplaySettingNotifier(this.ref) : super(false) {
    load();
  }

  final Ref ref;

  void load() async {
    final repo = ref.read(settingRepositoryProvider);
    state = await repo.shouldShowWideView();
  }

  void changeValue(bool value) async {
    final repo = ref.read(settingRepositoryProvider);
    await repo.setWideViewSetting(value);
    load();
    // Counter can use the "ref" to read other providers
  }
}
