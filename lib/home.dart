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
        Row(
          children: [
            SizedBox(
              width: 10.0,
            ),
            Text("Number of Passanger"),
            SizedBox(
              width: 20.0,
            ),
            Container(
              child: Text("select here"),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    )));
  }
}
