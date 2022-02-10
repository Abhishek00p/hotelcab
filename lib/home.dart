import 'package:flutter/material.dart';
import 'package:hotelcab/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        SizedBox(
          height: 40.0,
        ),
        TextButton.icon(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Hotel())),
          icon: const Icon(Icons.home),
          label: const Text(""),
        ),
      ],
    )));
  }
}
