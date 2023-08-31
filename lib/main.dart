import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasetestingapp/firebase_options.dart';
import 'package:firebasetestingapp/mobilenumberpage.dart';
import 'package:firebasetestingapp/newclass.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    listen();
    setState(() {
      newclass().age = 20;
    });
    // TODO: implement initState
    super.initState();
  }

  listen() {
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      print("fcmToken: $fcmToken");
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      // Error getting token.
    });
  }

  Widget build(BuildContext context) {
    print("starting screen : ${newclass().age}");
    return MaterialApp(
      home: Mobile_Number_Page(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
