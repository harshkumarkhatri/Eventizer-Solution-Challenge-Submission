import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

launchMailto() async {
  final mailtoLink = Mailto(
    to: ['mailharshkhatri@gmai.com'],
    subject: 'Help & Support',
  );
  // Triggering launch from url_launcher to launch the mail app
  await launch('$mailtoLink');
}
