import "dart:async";
import "package:flutter/material.dart";

mixin OverlayStateMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _overlayEntry;
  Timer? timer;

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (timer?.isActive == true) {
      timer?.cancel();
    }
  }

  Widget _dismissibleOverlay(Widget child) => Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              bottom: MediaQuery.of(context).padding.bottom +
                  kBottomNavigationBarHeight,
              left: 0,
              right: 0,
              child: Align(alignment: Alignment.bottomCenter, child: child)),
        ],
      );

  void insertOverlay(
    BuildContext context, {
    required Widget child,
    Duration duration = const Duration(seconds: 5),
  }) {
    removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (_) => _dismissibleOverlay(child),
    );

    Overlay.of(context)?.insert(_overlayEntry!);
    timer = Timer(duration, () {
      removeOverlay();
    });
  }

  bool get isOverlayShown => _overlayEntry != null;

  void toggleOverlay(BuildContext context, Widget child) =>
      isOverlayShown ? removeOverlay() : insertOverlay(context, child: child);

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    removeOverlay();
    super.didChangeDependencies();
  }
}
