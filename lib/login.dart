import "package:flutter/material.dart";
import 'package:hotelcab/home.dart';
import 'package:hotelcab/main.dart';
import 'package:hotelcab/registeration.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  String userName = "";
  String password = "";
  int phoneNumber = 0;

  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: _width,
      height: _height,
      child: Stack(children: [
        Container(
          height: _height,
          width: _width,
          color: Colors.white,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(136, 172, 79, 79),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  topLeft: Radius.circular(500))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 50, shadows: [
                Shadow(offset: Offset(2.0, 5.0), blurRadius: 10.0)
              ]),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(80))),
                width: _width / 1.1,
                height: _height / 2.5,
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email id",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        hintText: "abcd@gmail.com",
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "abcd#123",
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                          suffixIcon: Icon(Icons.remove_red_eye)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Hotel()));
                        },
                        child: Text("login"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
