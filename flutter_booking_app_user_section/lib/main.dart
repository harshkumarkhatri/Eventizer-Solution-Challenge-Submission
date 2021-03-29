import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/MainScreen/mainScreen_screen.dart';
import 'package:flutter_booking_app_user_section/views/pages/NoInternetConnection/noInternetConnection_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'repositories/checkConnection.dart';
import 'repositories/subToTopic_fcm.dart';
import 'views/pages/LoginSignUpScreen/loginSignup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FlutterSecureStorage storage = FlutterSecureStorage();
  String email = await storage.read(key: "email");
  String uid = await storage.read(key: "uid");

  await Firebase.initializeApp();
  runApp(MyApp(email));
}

class MyApp extends StatefulWidget {
  MyApp(String this.email);
  String email;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String connection;

  @override
  void initState() {
    super.initState();
    checkConn().then((value) {
      setState(() {
        connection = value;
      });
    });
    subToTopic_fcm();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.black,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: connection == null
          ? CircularProgressIndicator()
          : connection == 'none'
              ? NoInternetConnectionScreen()
              : widget.email == null
                  ? LoginSignUpScreen()
                  : MainScreen(),
    );
  }
}
