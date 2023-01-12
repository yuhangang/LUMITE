import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:lumi_assignment/features/setting/presentation/widgets/setting_screen_template.dart";

class StatisticsSettingScreen extends StatefulWidget {
  const StatisticsSettingScreen({super.key});

  @override
  State<StatisticsSettingScreen> createState() =>
      _StatisticsSettingScreenState();
}

class _StatisticsSettingScreenState extends State<StatisticsSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SettingScreenTemplate(
        title: "Statistics",
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
            CupertinoSwitch(value: false, onChanged: (value) {})
          ],
        ));
  }
}
