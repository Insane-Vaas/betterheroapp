import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkProvider {
  Future<String> createString(String refCode) async {
    final String url = "https://betterhero.in/$refCode";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      androidParameters: AndroidParameters(
        packageName: "com.example.betterheroapp",
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
        bundleId: "com.example.betterheroapp",
      ),
      link: Uri.parse(url),
      uriPrefix: "https://betterheroapp.page.link",
    );

    final FirebaseDynamicLinks links = await FirebaseDynamicLinks.instance;

    final refLink = await links.buildShortLink(parameters);

    return refLink.shortUrl.toString();
  }

  void initDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;

      Share.share("This is the link ${refLink.path}");
    }
  }
}
