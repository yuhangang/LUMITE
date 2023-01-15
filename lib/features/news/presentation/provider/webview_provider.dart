import "package:flutter_riverpod/flutter_riverpod.dart";

class WebViewStateNotifier extends StateNotifier<WebViewState> {
  WebViewStateNotifier(this.ref) : super(WebViewLoading(progress: 0));

  final Ref ref;

  void updateProgress(int progress) {
    state = WebViewLoading(progress: progress / 100);
    if (progress == 100) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _loadFinished();
      });
    }
  }

  void _loadFinished() => state = WebViewLoaded();

  void loadFailed() => state = WebViewFailed();
}

abstract class WebViewState {}

class WebViewLoading extends WebViewState {
  final double progress;
  WebViewLoading({
    required this.progress,
  });
}

class WebViewLoaded extends WebViewState {}

class WebViewFailed extends WebViewState {}
