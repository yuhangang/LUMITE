import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/features/setting/data/model/statistics_data.dart";
import "package:lumi_assignment/features/setting/presentation/provider/statistics_provider.dart";
import "package:lumi_assignment/features/setting/presentation/screen/statistic_setting_screen/last_read_widget.dart";
import "package:lumi_assignment/features/setting/presentation/widgets/setting_screen_template.dart";

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
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
                flex: 2, child: _buildTopicFollowed(statisticsData, context)),
          ],
        ),
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
              Flexible(
                fit: FlexFit.tight,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      statisticsData.mostClickTopicsData?.value1.displayText ??
                          "❓",
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

  Container _buildTopicFollowed(
      StatisticsData statisticsData, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "${statisticsData.numOfTopicsFollowed.length} Topics Followed",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.white, height: 0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
