import 'package:flutter/material.dart';
import 'login.dart';
import 'package:hotelcab/home.dart';
import "package:firebase_core/firebase_core.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
