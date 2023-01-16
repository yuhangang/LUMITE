import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:lumi_assignment/core/commons/constant.dart";
import "package:lumi_assignment/core/navigation/app_router.dart";
import "injection_container.dart" as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade50,
      statusBarIconBrightness: Brightness.dark));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Number Trivia",
      theme: appTheme(context),
      supportedLocales: const [
        Locale("en", ""), // Spanish, no country code
      ],
      routerConfig: appRouter,
    );
  }
}
