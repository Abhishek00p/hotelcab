import "package:flutter/material.dart";
import 'package:hotelcab/main.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.yellowAccent,
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 3.5,
          top: MediaQuery.of(context).size.height / 3.5,
          child: Container(
              child: Column(
            children: [
              Text("email id",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Text("password",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Text("phone number",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hotel()));
                  },
                  child: Text("register"))
            ],
          )),
        )
      ],
    ));
  }
}
