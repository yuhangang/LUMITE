import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:cached_network_image/cached_network_image.dart";

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
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    statisticsData.numOfNewsReadInOneAppSession.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "topics read",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "topics read",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }
}

class LastReadWidget extends StatelessWidget {
  final NewsDetailPageParam lastRead;

  const LastReadWidget({
    Key? key,
    required this.lastRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        sl
            .get<Coordinator>()
            .navigateToNewsDetailScreen(lastRead.news, lastRead.category);
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade200,
            borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.blue.shade700,
                BlendMode.modulate,
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: lastRead.news.imageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last Read",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white,
                        shadows: [
                          const BoxShadow(color: Colors.black, blurRadius: 2)
                        ]),
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
