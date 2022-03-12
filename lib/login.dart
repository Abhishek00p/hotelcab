import "package:flutter/material.dart";
import 'package:hotelcab/main.dart';
import 'package:hotelcab/registeration.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    bool obsecureValue = true;
    return Scaffold(
      backgroundColor: Color.fromARGB(200, 0, 0, 0),
      body: Stack(
        children: [
          Container(
            height: _height / 3,
            width: _width / 1.3,
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(150),
                    // bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(200))),
          ),
          Container(
            padding: EdgeInsets.only(left: _width / 2.5, top: 130),
            child: Text(
              'Welcome  Back ,',
              style: TextStyle(color: Colors.black, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              // color: Colors.green, //changess required
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 80, right: 80, bottom: 80),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          style: TextStyle(fontSize: 20),
                          obscureText: obsecureValue,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    obsecureValue = false;
                                  },
                                  icon: Icon(Icons.remove_red_eye))),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  Color.fromARGB(255, 119, 122, 129),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Hotel()));
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Registration()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 24),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromARGB(255, 196, 101, 101),
                                    fontSize: 18,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
