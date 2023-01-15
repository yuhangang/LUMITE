import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/core/navigation/app_router.dart";
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/core/presentation/widgets/custom_cache_network_image.dart";
import "package:lumi_assignment/features/setting/presentation/provider/statistics_provider.dart";
import "package:lumi_assignment/injection_container.dart";

class LastReadWidget extends ConsumerWidget {
  final NewsDetailPageParam lastRead;

  const LastReadWidget({
    Key? key,
    required this.lastRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        sl.get<Coordinator>().navigateToNewsDetailScreen(
            context, lastRead.news, lastRead.category);
        // TODO: thinking about a solution to gracefully handle refresh statistics when back from new details
        Future.delayed(const Duration(seconds: 1), () {
          ref.read(statisticsProvider.notifier).load();
        });
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade200,
            borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              children: [
                Expanded(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.blue.shade700,
                      BlendMode.modulate,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: lastRead.news.imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Last Read",
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: Colors.white, shadows: [
                            const BoxShadow(color: Colors.black, blurRadius: 2)
                          ]),
                        ),
                      ),
                      CustomCachedNetworkImage(
                          imageUrl: lastRead.news.publisherImageUrl,
                          height: 36,
                          width: 36,
                          fit: BoxFit.fitHeight,
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 2)
                          ]),
                    ],
                  ),
                  Text(
                    lastRead.news.newsTitle,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                        shadows: [
                          const BoxShadow(color: Colors.black, blurRadius: 2)
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
