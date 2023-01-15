import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:lumi_assignment/features/home/presentation/widgets/animated_bottom_nav.dart";
import "package:lumi_assignment/features/news/presentation/screens/home_screen/home_screen.dart";
import "package:lumi_assignment/features/setting/presentation/screen/setting_screen.dart";

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
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
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [HomeScreen(), SettingScreen()],
          ),
        ),
        ValueListenableBuilder<int>(
            valueListenable: _currentTabIndex,
            builder: (context, index, child) {
              return AnimatedBottomNaviBar(
                bottomNaviController: bottomNaviController,
                bottomnavigationkey: bottomnavigationkey,
                index: index,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.newspaper), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ],
                onTapItem: (_) {
                  _currentTabIndex.value = _;
                  setState(() {
                    _pageController.jumpToPage(_);
                    //if ((_ - index).abs() > 1) {
                    //  index = _;
                    //  pageController.jumpToPage(_);
                    //} else {
                    //  index = _;
                    //  pageController.animateToPage(_,
                    //      duration: const Duration(milliseconds: 400),
                    //      curve: Curves.easeOut);
                    //}
                  });
                },
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
}
