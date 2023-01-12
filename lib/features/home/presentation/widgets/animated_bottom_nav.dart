import "package:flutter/material.dart";

class AnimatedBottomNaviBar extends StatelessWidget {
  const AnimatedBottomNaviBar(
      {Key? key,
      required this.bottomNaviController,
      required this.bottomnavigationkey,
      required this.index,
      required this.onTapItem,
      required this.items})
      : super(key: key);
  final void Function(int) onTapItem;
  final AnimationController bottomNaviController;
  final GlobalKey<State<StatefulWidget>> bottomnavigationkey;
  final int index;

  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedBuilder(
          animation: bottomNaviController,
          builder: (_, child) {
            return SizeTransition(
              axisAlignment: -1,
              sizeFactor: bottomNaviController,
              child: BottomNavigationBar(
                key: bottomnavigationkey,
                currentIndex: index,
                onTap: onTapItem,
                elevation: 3,
                items: items,
              ),
            );
          },
        ),
      ],
    );
  }
}
