import "package:flutter/material.dart";

class SettingScreenTemplate extends StatelessWidget {
  final String title;
  final Widget child;
  const SettingScreenTemplate({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 32, bottom: 40, left: 16, right: 16),
          child: child,
        ));
  }
}
