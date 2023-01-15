import "package:url_launcher/url_launcher.dart";

abstract class UrlLaunchHelper {
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    final canLaunch = await canLaunchUrl(uri);
    if (canLaunch) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
