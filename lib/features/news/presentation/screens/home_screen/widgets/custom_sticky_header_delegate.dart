import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

enum StickyHeaderWidgetAnimation { popInOut, fadeInOut, growShrink }

class CustomStickyHeaderWidgetDelegate
    implements SliverPersistentHeaderDelegate {
  late double fullOpacityOffset;
  late double zeroOpacityOffset;
  late double growBarHeight;
  late double startGrowOffset;
  late double startShrinkOffset;
  double growBarHeightDiff = 0.0;

  final StickyHeaderWidgetAnimation headerAnimation;
  final Widget expandableWidget;
  final Widget stickyWidget;
  final double stickyWidgetHeight;

  late double minExtentWidget;
  late double maxExtentWidget;

  @override
  final TickerProvider vsync;

  CustomStickyHeaderWidgetDelegate(
      {required this.expandableWidget,
      required this.stickyWidget,
      required this.vsync,
      this.headerAnimation = StickyHeaderWidgetAnimation.popInOut,
      this.minExtentWidget = 0.0,
      this.maxExtentWidget = 0.0,
      this.stickyWidgetHeight = kToolbarHeight});

  @override
  double get minExtent => minExtentWidget;

  @override
  double get maxExtent => maxExtentWidget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    minExtentWidget = MediaQuery.of(context).padding.top + stickyWidgetHeight;

    _calculateAnimationValue();
    return Container(
      color: Colors.grey.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(0,
                      MediaQuery.of(context).padding.top - (shrinkOffset / 4)),
                  child: expandableWidget,
                ),
                Container(
                  height: MediaQuery.of(context).padding.top,
                  color: Colors.grey.shade50,
                ),
                if (headerAnimation == StickyHeaderWidgetAnimation.growShrink)
                  _buildGrowAppBar(context, shrinkOffset),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildFloatingSpinner()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingSpinner() {
    return SizedBox(
        height: stickyWidgetHeight,
        width: double.infinity,
        child: stickyWidget);
  }

  Widget _buildGrowAppBar(BuildContext context, double offset) {
    var growAppbarH = _calculateHeight(offset);
    return Container(
      height: growAppbarH,
    );
  }

  void _calculateAnimationValue() {
    if (headerAnimation == StickyHeaderWidgetAnimation.growShrink) {
      fullOpacityOffset = minExtent;
      zeroOpacityOffset = maxExtent;
      growBarHeight = stickyWidgetHeight / 2;
      startGrowOffset = (maxExtent - minExtent) - growBarHeight;
      startShrinkOffset = startGrowOffset - growBarHeight;
    } else if (headerAnimation == StickyHeaderWidgetAnimation.popInOut) {
      fullOpacityOffset = minExtent;
      zeroOpacityOffset = maxExtent;
    } else {
      fullOpacityOffset = maxExtent - minExtent;
      zeroOpacityOffset = maxExtent;
    }
  }

  double _calculateHeight(double offset) {
    if (offset >= startGrowOffset) {
      if (growBarHeightDiff == 28.0) {
        growBarHeightDiff = 28.0;
      } else {
        growBarHeightDiff += 1;
      }
    } else if (offset <= startShrinkOffset) {
      if (growBarHeightDiff <= 28.0 && growBarHeightDiff > 0) {
        growBarHeightDiff -= 1;
      } else {
        growBarHeightDiff = 0.0;
      }
    }
    if (growBarHeightDiff == 28.0) {
      return 28.0;
    } else if (growBarHeightDiff == 0.0) {
      return 0.0;
    }

    return growBarHeightDiff;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration {
    return PersistentHeaderShowOnScreenConfiguration(
      minShowOnScreenExtent: minExtent,
      maxShowOnScreenExtent: maxExtent,
    );
  }

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration(
        stretchTriggerOffset: maxExtent,
        onStretchTrigger: () async {},
      );

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration {
    //return null because floating: false,
    return null; //FloatingHeaderSnapConfiguration();
  }
}
