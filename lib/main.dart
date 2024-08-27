import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification_android_ios/firebase_api.dart';
import 'package:notification_android_ios/firebase_options.dart';
import 'package:notification_android_ios/pages/home_page.dart';
import 'package:notification_android_ios/pages/notification_page.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initializeNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      navigatorKey: navigationKey,
      routes: {
        '/notification_page': (context) => const NotificationPage(),
      },
    );
  }
}

