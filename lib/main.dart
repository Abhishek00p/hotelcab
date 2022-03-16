import 'package:flutter/material.dart';
import 'login.dart';
import 'package:hotelcab/home.dart';
import "package:firebase_core/firebase_core.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyAPL348l8tmicyZHqq2AiUVxN9P7zSFnIA",
    appId: "1:667156846850:web:3f7e18e2cebe241d22ca1b",
    messagingSenderId: "667156846850",
    projectId: "hotelcab-107a0",
  ));
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => LoginPage(),
      '/login': (BuildContext context) => LoginPage(),
      '/home': (BuildContext context) => HomePage()
    },
    debugShowCheckedModeBanner: false,
  ));
}

class Hotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(child: HomePage()),
    );
  }
}
