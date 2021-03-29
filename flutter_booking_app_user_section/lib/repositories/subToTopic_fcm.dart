import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void subToTopic_fcm() {
  _firebaseMessaging.subscribeToTopic('eventCreators');
}
