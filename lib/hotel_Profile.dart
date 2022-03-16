import 'package:flutter/material.dart';
import 'package:hotelcab/menuSidebar.dart';
import 'main.dart';

class Hotel_Profile extends StatelessWidget {
  Hotel_Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Hotel_Profile", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
