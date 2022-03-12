import 'package:flutter/material.dart';
import 'package:hotelcab/driverAvail.dart';
import 'package:hotelcab/hotel_Profile.dart';
import 'package:hotelcab/login.dart';
import 'package:hotelcab/menuSidebar.dart';
import 'package:hotelcab/recent_booking.dart';
import 'home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized;

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => LoginPage(),
      '/login': (BuildContext context) => LoginPage(),
      '/home': (BuildContext context) => Hotel()
    },
    debugShowCheckedModeBanner: false,
  ));
}

List<Widget> _pages = [HomePage(), Booking(), Driver(), Hotel_Profile()];

class Hotel extends StatefulWidget {
  Hotel({Key? key}) : super(key: key);

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  int _selectedIndex = 0;
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: navigationD(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 31, 31),
        title: const Center(
            child: Text(
          "HotelCab",
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            tooltip: "Search ",
          )
        ],
      ),
    );
  }
}
