import "package:flutter/material.dart";
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/injection_container.dart";

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 16, bottom: 40, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 32,
                ),
                SettingItem(
                  title: "Topics",
                  onTap: () =>
                      sl.get<Coordinator>().navigateToTopicsSettingScreen(),
                ),
                const SizedBox(
                  height: 16,
                ),
                SettingItem(
                  title: "Display 🎨",
                  onTap: () =>
                      sl.get<Coordinator>().navigateToDisplaySettingScreen(),
                ),
                const SizedBox(
                  height: 16,
                ),
                SettingItem(
                  title: "Statistics 📈",
                  onTap: () =>
                      sl.get<Coordinator>().navigateToStatsticsSettingScreen(),
                ),
              ],
            )),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade50,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onPrimary,
            )
          ],
        ),
      ),
    );
  }
}
