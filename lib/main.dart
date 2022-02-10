import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MaterialApp(home: Hotel()));

class Hotel extends StatelessWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        foregroundColor: Colors.white70,
        title: const Text("HotelCab"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            Text("Number of passanger  "),
          ],
        )
      ]),
    );
  }
}
