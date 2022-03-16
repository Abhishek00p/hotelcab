
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotelcab/login.dart';
import 'package:hotelcab/DatabaseManager.dart';
import 'DatabaseManager.dart';
import 'menuSidebar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List theList = [];
  var email = LoginPage().createState().userEmail;
  var pass = LoginPage().createState().userPassword;
  final FirebaseAuth user = FirebaseAuth.instance;
  var name, locationn, contact, nPassanger;
  var fair = "250";

  var _nameController = TextEditingController();
  var _PassangerController = TextEditingController();
  //passanger
  var _ContactController = TextEditingController();
  var _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    // CollectionReadWrite();
    return Scaffold(
      drawer: navigationD(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "HotelCab",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // 3
                print(
                    "//---------------------- $email $pass -----------------//\n");
                user.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => LoginPage())));
              })
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: _width,
            height: _height,
            color: Colors.transparent,
          ),
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Name of Customer : ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: _width / 4,
                    child: TextField(
                      controller: _nameController,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      maxLength: 30,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Jhon Doe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Number of Passanger : ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: _width / 4,
                    child: TextField(
                      controller: _PassangerController,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      maxLength: 2,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "1",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Contact Number : ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: _width / 4,
                    child: TextField(
                      controller: _ContactController,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      maxLength: 15,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "9345445454",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Location : ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: _width / 4,
                    child: TextField(
                      controller: _locationController,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                      maxLength: 40,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Taj Hotel, marine lines",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Fair : ",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Center(
                    child: Text(
                      fair,
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    name = _nameController.text;
                    locationn = _locationController.text;
                    contact = _ContactController.text;
                    nPassanger = _PassangerController.text;

                    if (name.isNotEmpty &&
                        contact.toString().isNotEmpty &&
                        nPassanger.toString().isNotEmpty &&
                        locationn.isNotEmpty) {
                      bool mybool = CollectionReadWrite().myAddFunc(
                          name,
                          int.parse(nPassanger),
                          int.parse(contact),
                          locationn,
                          int.parse(fair));
                      if (mybool) {
                        _nameController.text = "";
                        _ContactController.text = "";
                        _locationController.text = "";
                        _PassangerController.text = "";

                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) =>
                                myDialog("Customer Details added Succesfully"));
                      }
                    } else {
                      print("Input taklas ka ? -------------------------\n\n");
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        ],
      ),
    );
  }
}

class myDialog extends StatelessWidget {
  final title;
  myDialog(this.title);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      elevation: 30,
      title: Text("Result"),
      content: Text(title),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("ok"))
      ],
    );
  }
}
