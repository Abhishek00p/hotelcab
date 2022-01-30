import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hotelcab/home.dart';

void main() {
  runApp(const MaterialApp(
    home: Hotel(),
  ));
}

class Hotel extends StatelessWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("HotelCab"),
        actions: [
          TextButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              icon: const Icon(Icons.search),
              label: const Text("fg"))
        ],
      ),
      body: const Text("hello"),
    );
  }
}
