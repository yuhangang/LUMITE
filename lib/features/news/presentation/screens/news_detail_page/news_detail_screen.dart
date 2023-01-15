import "dart:async";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/core/presentation/widgets/custom_cache_network_image.dart";
import "package:lumi_assignment/core/presentation/widgets/overlay_state_mixin.dart";
import "package:lumi_assignment/features/setting/presentation/provider/statistics_provider.dart";
import "package:webview_flutter/webview_flutter.dart";

import "package:lumi_assignment/core/commons/helper/url_launch_helper.dart";
import "package:lumi_assignment/features/news/data/model/news.dart";
import "package:lumi_assignment/features/news/presentation/provider/webview_provider.dart";
import "package:lumi_assignment/features/setting/data/model/news_category.dart";

class NewsDetailScreen extends ConsumerStatefulWidget {
  final News news;
  final NewsCategory category;
  const NewsDetailScreen({
    Key? key,
    required this.news,
    required this.category,
  }) : super(key: key);

  @override
  ConsumerState<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends ConsumerState<NewsDetailScreen>
    with OverlayStateMixin {
  late final WebViewController _webViewController = WebViewController();
  final webViewProvider =
      StateNotifierProvider<WebViewStateNotifier, WebViewState>((ref) {
    return WebViewStateNotifier(ref);
  });

  @override
  void initState() {
    _webViewController
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            ref.read(webViewProvider.notifier).updateProgress(progress);
          },
          onPageStarted: (String url) {
            //debugPrint("Page started loading: $url");
          },
          onPageFinished: (String url) {
            ref.read(webViewProvider.notifier).loadFinished();
          },
          onWebResourceError: (WebResourceError error) {
            ref.read(webViewProvider.notifier).loadFailed();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith("https://www.youtube.com/")) {
              debugPrint("blocking navigation to ${request.url}");
              return NavigationDecision.prevent;
            }
            debugPrint("allowing navigation to ${request.url}");
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        "Toaster",
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.news.link));
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
        insertOverlay(TextButton(
            onPressed: () {},
            child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(50),
                child: const Text("abc"))));
      }
    });
    ref
        .read(statisticsProvider.notifier)
        .onOpenNews(widget.news, widget.category);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late final WebViewCookieManager cookieManager = WebViewCookieManager();
  @override
  Widget build(BuildContext context) {
    final webViewState = ref.watch(webViewProvider);
    return WillPopScope(
      onWillPop: () async {
        if (isOverlayShown) {
          removeOverlay();
        }
        return true;
      },
      child: Scaffold(
        extendBody: false,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 2,
          title: Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CustomCachedNetworkImage(
                imageUrl: widget.news.publisherImageUrl,
                fit: BoxFit.fitHeight,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(0, 5),
                      blurRadius: 2)
                ],
                height: 32,
                width: 32,
              ),
            ),
            Text(
              widget.news.publisherName,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.w600),
            )
          ]),
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                position: PopupMenuPosition.under,
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        onTap: () async {
                          UrlLaunchHelper.openUrl(widget.news.link);
                        },
                        value: 0,
                        child: Row(
                          children: const [
                            Icon(CupertinoIcons.globe),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Open In Brower"),
                          ],
                        ),
                      ),
                    ]),
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: webViewState is WebViewLoading
                      ? const Duration(milliseconds: 200)
                      : Duration.zero,
                  color: Colors.blue.shade600,
                  height: 5,
                  width: webViewState is WebViewLoading
                      ? MediaQuery.of(context).size.width *
                          webViewState.progress
                      : 0,
                ),
              )),
        ),
        body: WebViewWidget(controller: _webViewController),
      ),
    );
  }
}
