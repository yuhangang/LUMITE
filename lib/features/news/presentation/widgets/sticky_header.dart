import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

enum StickyHeaderWidgetAnimation { popInOut, fadeInOut, growShrink }

//Please keep all the comment for future references because the widget still
//keep changing until found the final solution
class RewardsStickyHeaderWidgetDelegate
    implements SliverPersistentHeaderDelegate {
  late double fullOpacityOffset;
  late double zeroOpacityOffset;
  late double growBarHeight;
  late double startGrowOffset;
  late double startShrinkOffset;
  double growBarHeightDiff = 0.0;

  final StickyHeaderWidgetAnimation headerAnimation;
  final Widget carrousselWidget;
  final Widget stickyWidget;
  final double stickyWidgetHeight;
  final String navigationTitle;
  final bool isRewardsPage;
  final bool isDetailPage;
  final bool isPlanDetailPage;
  final bool isConfigurablePackPage;
  final bool showAppbar;
  final bool showInboxButton;
  final bool enableStretchHeader;

  final bool enableStickyWidget;

  final bool showStatusBanner;
  final double statusBannerHeight;
  final Color statusBannerColor;

  late double minExtentWidget;
  late double maxExtentWidget;

  RewardsStickyHeaderWidgetDelegate(
      {required this.carrousselWidget,
      required this.stickyWidget,
      this.headerAnimation = StickyHeaderWidgetAnimation.popInOut,
      this.navigationTitle = "",
      this.isRewardsPage = false,
      this.isDetailPage = false,
      this.isPlanDetailPage = false,
      this.isConfigurablePackPage = false,
      this.minExtentWidget = 0.0,
      this.maxExtentWidget = 0.0,
      this.stickyWidgetHeight = kToolbarHeight,
      this.showAppbar = true,
      this.showInboxButton = false,
      this.enableStretchHeader = false,
      this.showStatusBanner = false,
      this.statusBannerColor = Colors.white,
      this.statusBannerHeight = 0.0,
      this.enableStickyWidget = true})
      : assert(() {
          if (showStatusBanner && statusBannerHeight == 0.0) {
            throw FlutterError("Height of status banner must more than 0 if "
                "showStatusBanner is true");
          }
          return true;
        }());

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
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: stickyWidgetHeight / 2,
                  child:
                      // ignore: sized_box_for_whitespace
                      Container(
                          height: kToolbarHeight,
                          child: Align(
                            child: Text(
                              navigationTitle,
                              textAlign: TextAlign.center,
                            ),
                          )),
                ),
                Transform.translate(
                  offset: Offset(0,
                      MediaQuery.of(context).padding.top - (shrinkOffset / 3)),
                  child: carrousselWidget,
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
    if (!enableStickyWidget) {
      return;
    }

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
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration {
    return PersistentHeaderShowOnScreenConfiguration(
      minShowOnScreenExtent: minExtent,
      maxShowOnScreenExtent: maxExtent,
    );
  }

  @override
  TickerProvider? get vsync {
    return null;
  }

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration {
    return enableStretchHeader ? OverScrollHeaderStretchConfiguration() : null;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration {
    //return null because floating: false,
    return null; //FloatingHeaderSnapConfiguration();
  }
}
