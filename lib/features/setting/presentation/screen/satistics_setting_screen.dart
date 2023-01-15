import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:lumi_assignment/core/presentation/widgets/custom_cache_network_image.dart";
import "package:lumi_assignment/features/setting/data/model/statistics_data.dart";
import "package:lumi_assignment/features/setting/presentation/provider/statistics_provider.dart";
import "package:lumi_assignment/features/setting/presentation/widgets/setting_screen_template.dart";
import "package:lumi_assignment/core/navigation/app_router.dart";
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/injection_container.dart";

class StatisticsSettingScreen extends ConsumerStatefulWidget {
  const StatisticsSettingScreen({super.key});

  @override
  ConsumerState<StatisticsSettingScreen> createState() =>
      _StatisticsSettingScreenState();
}

class _StatisticsSettingScreenState
    extends ConsumerState<StatisticsSettingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(statisticsProvider.notifier).load();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final statisticsResponse = ref.watch(statisticsProvider);
    return SettingScreenTemplate(
      title: "Statistics",
      child: statisticsResponse.when(
          data: (statisticsData) => _buildBody(context, statisticsData),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (obj, stackTrace) =>
              const Center(child: CircularProgressIndicator())),
    );
  }

  Widget _buildBody(BuildContext context, StatisticsData statisticsData) {
    return Column(
      children: [
        if (statisticsData.lastRead != null)
          LastReadWidget(
            lastRead: statisticsData.lastRead!,
          ),
        const SizedBox(
          height: 16,
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: _buildNumOfNewsRead(statisticsData, context),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: _buildTopTopic(statisticsData, context),
            ),
          ),
        ]),
      ],
    );
  }

  Container _buildNumOfNewsRead(
      StatisticsData statisticsData, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade200,
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.center,
            child: LayoutBuilder(builder: (context, constraints) {
              return FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  statisticsData.numOfNewsReadInOneAppSession.toString(),
                  textHeightBehavior: const TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even),
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: constraints.maxHeight,
                    height: 0.9,
                  ),
                ),
              );
            }),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                "News Read",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTopTopic(
      StatisticsData statisticsData, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade200,
          borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(14),
      child: Stack(
        children: [
          if (statisticsData.mostClickTopicsData != null)
            Align(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    statisticsData.mostClickTopicsData!.value1.emoji,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white, height: 0.8),
                  ),
                ),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Your top topic",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              if (statisticsData.mostClickTopicsData != null)
                Flexible(
                  fit: FlexFit.tight,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        statisticsData.mostClickTopicsData!.value1.displayText,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

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
        sl
            .get<Coordinator>()
            .navigateToNewsDetailScreen(lastRead.news, lastRead.category);
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
