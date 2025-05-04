import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<bool> launchUrlMethod(Uri uri) async {
  if (!await canLaunchUrl(uri)) {
    final bool launched = await launchUrl(
      uri,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: BrowserConfiguration(),
    );
    return true;
    if (!launched) {
      log('Could not launch $uri');
    }
  } else {
    log('Cannot launch URL: $uri');
    return false;
  }
}
