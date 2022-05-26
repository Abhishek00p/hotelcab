import "package:flutter/material.dart";
import 'package:hotelcab/DatabaseManager.dart';
import 'package:hotelcab/EmailVerifyPage.dart';
import 'package:hotelcab/home.dart';
import 'package:hotelcab/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotelcab/menuSidebar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _usernameController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  checkauth() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Hotel()));
      }
    });
  }

  var userEmail;
  var userPassword;
  var userName;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    checkauth();

    return Scaffold(
      backgroundColor: Color.fromARGB(200, 0, 0, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: const Text(
              'Welcome  Back ',
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          Container(
            // color: Colors.green, //changess required
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: _width - 30,
                    child: TextField(
                      controller: _usernameController,
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: _width - 30,
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: _width - 30,
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 36, 96, 238),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Hotel()));
                              try {
                                userName = _usernameController.text;
                                userEmail = _emailController.text;
                                if (userEmail == null || userEmail == "") {
                                  return;
                                }
                                userPassword = _passwordController.text;

                                if (userPassword == null ||
                                    userPassword == "") {
                                  return;
                                }
                                if (userPassword.length < 6) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Your Password is Weeak')));
                                  return;
                                }
                                print("my user : \n\n");
                                print(_auth.currentUser);

                                // print(userEmail + " " + userPassword);
                              } catch (e) {
                                print(e.toString());
                              }
                              Future<bool> userExist = AuthenticationService(
                                      _auth, userEmail, userPassword)
                                  .checkIfEmailInUse();

                              if (userExist == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotel()));
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyEmail()));
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 196, 101, 101),
                              fontSize: 18,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
