import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
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

class _NewsDetailScreenState extends ConsumerState<NewsDetailScreen> {
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            width: 14 * 12 + 38,
            behavior: SnackBarBehavior.floating,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100))),
            content: GestureDetector(
              onTap: () => UrlLaunchHelper.openUrl("https://google.com"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.mail),
                  SizedBox(
                    width: 16,
                  ),
                  Text("Share Statistics")
                ],
              ),
            )));
      }
    });
    ref
        .read(statisticsProvider.notifier)
        .onOpenNews(widget.news, widget.category);
    super.initState();
  }

  late final WebViewCookieManager cookieManager = WebViewCookieManager();
  @override
  Widget build(BuildContext context) {
    final webViewState = ref.watch(webViewProvider);
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).clearSnackBars();
        return true;
      },
      child: Scaffold(
        extendBody: false,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 2,
          title: Row(children: [
            Container(
              height: 32,
              width: 32,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade100,
                        offset: const Offset(0, 5),
                        blurRadius: 2)
                  ]),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                imageUrl: widget.news.publisherImageUrl,
                fit: BoxFit.fitHeight,
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
