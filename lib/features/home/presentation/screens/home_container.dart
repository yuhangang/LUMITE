import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:go_router/go_router.dart";
import "package:lumi_assignment/core/navigation/app_path.dart" as app_path;
import "package:lumi_assignment/features/home/presentation/widgets/animated_bottom_nav.dart";

class HomeContainer extends StatefulWidget {
  final Widget child;
  const HomeContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer>
    with TickerProviderStateMixin {
  final bottomnavigationkey = GlobalKey();
  late AnimationController bottomNaviController;
  final ValueNotifier<int> _currentTabIndex = ValueNotifier(0);
  bool isAnimatedHide = false;
  bool isAnimatedShow = false;

  @override
  void initState() {
    bottomNaviController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    bottomNaviController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(fit: StackFit.expand, children: [
        NotificationListener<UserScrollNotification>(
          onNotification: handleScrollActivityDetected,
          child: widget.child,
        ),
        ValueListenableBuilder<int>(
            valueListenable: _currentTabIndex,
            builder: (context, index, child) {
              return AnimatedBottomNaviBar(
                bottomNaviController: bottomNaviController,
                bottomnavigationkey: bottomnavigationkey,
                index: _calculateSelectedIndex(context),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.newspaper), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ],
                onTapItem: (tappedIndex) => _onItemTapped(tappedIndex, context),
              );
            }),
      ]),
    );
  }

  bool handleScrollActivityDetected(UserScrollNotification notification) {
    if ((notification.metrics is PageMetrics)) return true;

    if (notification.direction == ScrollDirection.forward && !isAnimatedShow) {
      isAnimatedHide = false;
      isAnimatedShow = true;

      bottomNaviController.forward();
    } else if (notification.direction == ScrollDirection.reverse &&
        !isAnimatedHide) {
      isAnimatedHide = true;
      isAnimatedShow = false;

      bottomNaviController.reverse();
    }

    if (notification.direction == ScrollDirection.forward) {
      bottomNaviController.forward();
    }
    if (notification.direction == ScrollDirection.reverse) {
      bottomNaviController.reverse();
    }
    return true;
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(app_path.setting)) {
      return 1;
    }
    if (location.startsWith(app_path.home)) {
      return 0;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext contxt) {
    switch (index) {
      case 0:
        context.go(app_path.home);
        break;
      case 1:
        context.go(app_path.setting);
        break;
    }
  }
}
