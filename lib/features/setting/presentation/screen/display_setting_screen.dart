import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/features/setting/presentation/provider/display_setting_provider.dart";
import "package:lumi_assignment/features/setting/presentation/widgets/setting_screen_template.dart";

class DisplaySettingScreen extends ConsumerStatefulWidget {
  const DisplaySettingScreen({super.key});

  @override
  ConsumerState<DisplaySettingScreen> createState() =>
      _DisplaySettingScreenState();
}

class _DisplaySettingScreenState extends ConsumerState<DisplaySettingScreen> {
  @override
  void initState() {
    ref.read(displaySettingProvider.notifier).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shouldShowWideView = ref.watch(displaySettingProvider);
    return SettingScreenTemplate(
        title: "Display",
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wide view",
                      style: Theme.of(context).textTheme.bodyText1),
                  Text(
                    "Larger fonts & thumbnails for easy reading",
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            CupertinoSwitch(
                value: shouldShowWideView,
                onChanged: (value) => ref
                    .read(displaySettingProvider.notifier)
                    .changeValue(value))
          ],
        ));
  }
}
