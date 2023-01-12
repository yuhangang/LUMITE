import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:get_it/get_it.dart";
import "package:go_router/go_router.dart";
import "package:lumi_assignment/core/commons/helper/dio_logger.dart";
import "package:lumi_assignment/core/commons/helper/dio_mock_interceptor.dart";
import "package:lumi_assignment/core/navigation/app_router.dart";
import "package:lumi_assignment/core/navigation/coordinator.dart";
import "package:lumi_assignment/core/navigation/coordinator_impl.dart";
import "package:lumi_assignment/features/news/data/data_source/news_data_source.dart";
import "package:lumi_assignment/features/news/data/repo/news_repository.dart";
import "package:lumi_assignment/features/setting/data/repo/setting_repository.dart";

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<GoRouter>(getRouter());
  sl.registerSingleton<Coordinator>(CoordinatorImpl());
  final dio = Dio();
  if (kDebugMode || kProfileMode) {
    dio.interceptors.add(DioLoggingInterceptor());
    dio.interceptors.add(DioMockInterceptor());
  }
  sl.registerSingleton<NewsDataSource>(NewsDataSourceImpl(dio: dio));
  sl.registerSingleton<NewsRepository>(
      NewsRepositoryImpl(newsDataSource: sl.get<NewsDataSource>()));
  sl.registerSingleton<SettingRepository>(SettingRepositoryImpl());
}
