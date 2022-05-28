import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  final user = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 20,
                  width: 100,
                  // color: Colors.amberAccent,
                  child: Text(
                    " <  Go Back",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Please Write down your Email ID , We will send you a verification Link to your Email . Click On the Link to verify that ,it is you .  ",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.black, fontSize: 20),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Type your Email Here",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      final list = await FirebaseAuth.instance
                          .fetchSignInMethodsForEmail(_controller.text.trim());
                      if (list.isEmpty) {
                        print("User not found 78");
                      } else {
                        print("User found");
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(
                                email: _controller.text.trim())
                            .then((value) {
                          Navigator.pop(context);
                        }).onError((error, stackTrace) {
                          print("Emailverify 87");
                          print(error);
                          print(stackTrace);
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.lightBlueAccent),
                      child: Center(
                        child: Text("Send me Reset Password Link"),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
