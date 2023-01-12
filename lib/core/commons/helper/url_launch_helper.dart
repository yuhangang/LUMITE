import "package:url_launcher/url_launcher.dart";

abstract class UrlLaunchHelper {
  static Future<void> launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(url);
    }
  }
}
