import 'package:flutter/material.dart';
import 'main.dart';

class Driver extends StatelessWidget {
  Driver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Driver", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
