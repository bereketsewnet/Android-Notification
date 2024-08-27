import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_android_ios/main.dart';

class FirebaseApi {
  // create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initializeNotifications() async {
    // request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token from this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token (normally you would send this to your server)
    print('Token: $fCMToken');
  }

// function to handle received message
  void handleMessage(RemoteMessage? message) {
    // if the message is null, do nothing
    if (message == null) return;

    // navigator to new screen when message is received and user taps notification
    navigationKey.currentState!.pushNamed(
      '/notification_page',
      arguments: message,
    );
  }

// function to initialize foreground and background settings

// function
}
