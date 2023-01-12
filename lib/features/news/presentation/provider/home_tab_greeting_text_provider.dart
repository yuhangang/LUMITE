import "package:riverpod/riverpod.dart";

class HomeTabGreetingText {
  final String title;
  final String? subtitle;
  HomeTabGreetingText({
    required this.title,
    required this.subtitle,
  });
}

final homeTabGreetingTextProvider = Provider<HomeTabGreetingText>((ref) {
  final currentTime = DateTime.now().toLocal();
  final hour = currentTime.hour;

  if (hour >= 0 && hour < 12) {
    return HomeTabGreetingText(
        title: "Good Morning", subtitle: "Catch up on news you’ve missed");
  } else if (hour >= 12 && hour < 18) {
    return HomeTabGreetingText(title: "Good Afternoon", subtitle: null);
  } else {
    return HomeTabGreetingText(
        title: "Good Night", subtitle: "Have a good rest!");
  }
});
