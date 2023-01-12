import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:lumi_assignment/injection_container.dart";
import "injection_container.dart" as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade50,
    ),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl.get<GoRouter>();
    return MaterialApp.router(
      title: "Number Trivia",
      theme: ThemeData(
          fontFamily: "Poppins",
          dividerTheme: DividerThemeData(
              color: Colors.grey.shade300, thickness: 0.4, space: 32),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade50,
              shadowColor: Colors.grey.shade600.withOpacity(0.1),
              foregroundColor: Colors.blue.shade500,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.grey.shade50)),
          snackBarTheme: const SnackBarThemeData(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100))),
          ),
          colorScheme: ColorScheme(
              primary: Colors.green.shade800,
              secondary: Colors.green.shade600,
              brightness: Brightness.light,
              onPrimary: Colors.green.shade200,
              onSecondary: Colors.green.shade600,
              error: Colors.red,
              onError: Colors.red.shade300,
              background: Colors.grey.shade100,
              onBackground: Colors.grey.shade50,
              surface: Colors.grey,
              onSurface: Colors.grey.shade300),
          textTheme: TextTheme(
              headline5: const TextStyle(
                  fontSize: 26, height: 1.2, fontWeight: FontWeight.w700),
              headline6: const TextStyle(
                  fontSize: 20, height: 1.2, fontWeight: FontWeight.w600),
              bodyText1:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              bodyText2:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              subtitle1: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              subtitle2: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400))),
      supportedLocales: const [
        Locale("en", ""), // Spanish, no country code
      ],
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
    );
  }
}
