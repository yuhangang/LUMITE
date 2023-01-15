part of home_screen;

extension _HomeScreenTabVisibilityExtension on _HomeScreenState {
  Widget _applyVisibilityDetector(BuildContext context,
      {required NewsCategory category, required Widget child}) {
    if (category.id == "covid") {
      return _applyVisibilityDetectorToCovidTab(category, context, child);
    }
    return child;
  }

  VisibilityDetector _applyVisibilityDetectorToCovidTab(
      NewsCategory category, BuildContext context, Widget child) {
    return VisibilityDetector(
      key: Key(category.id),
      onVisibilityChanged: (info) {
        log("visibility ${info.visibleFraction}");
        if (info.visibleFraction == 1) {
          insertOverlay(context,
              child: GestureDetector(
                onTap: () {
                  UrlLaunchHelper.openUrl("https://luminews.my/covidtracker");
                  removeOverlay();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.share,
                        size: Theme.of(context).textTheme.subtitle1?.fontSize,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Share Statistics",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ));
        } else if (info.visibleFraction == 0) {
          removeOverlay();
        }
      },
      child: child,
    );
  }
}
