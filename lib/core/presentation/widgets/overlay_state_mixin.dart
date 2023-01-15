import "dart:async";

import "package:flutter/material.dart";

mixin OverlayStateMixin<T extends StatefulWidget> on State<T> {
  // 2
  OverlayEntry? _overlayEntry;

  // 3
  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // 4
  Widget _dismissibleOverlay(Widget child) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: removeOverlay,
            ),
          ),
          child,
        ],
      );

  // 5
  void insertOverlay(Widget child,
      {Duration duration = const Duration(seconds: 5)}) {
    // 6
    _overlayEntry = OverlayEntry(
      builder: (_) => _dismissibleOverlay(child),
    );

    // 7
    Overlay.of(context)?.insert(_overlayEntry!);
    Timer(duration, () {
      removeOverlay();
    });
  }

// 1
  bool get isOverlayShown => _overlayEntry != null;

// 2
  void toggleOverlay(Widget child) =>
      isOverlayShown ? removeOverlay() : insertOverlay(child);

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
