import "package:flutter_riverpod/flutter_riverpod.dart";

class WebViewStateNotifier extends StateNotifier<WebViewState> {
  WebViewStateNotifier(this.ref) : super(WebViewLoading(progress: 0));

  final Ref ref;

  void updateProgress(int progress) {
    if (progress < 100) {
      state = WebViewLoading(progress: progress / 100);
    } else {
      state = WebViewLoaded();
    }
  }

  void loadFinished() => state = WebViewLoaded();

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
