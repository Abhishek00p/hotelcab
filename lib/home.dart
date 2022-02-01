import 'package:flutter/material.dart';
import 'package:hotelcab/main.dart';

void main() {
  runApp(const MaterialApp(
    home:  HomePage(),
    title: "its home page",
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
      children: [
        TextButton.icon(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  Hotel())),
          icon: const Icon(Icons.home),
          label: const Text(""),
        ),
      ],
    ));
  }
}
