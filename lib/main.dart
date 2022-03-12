import 'package:flutter/material.dart';
import 'package:hotelcab/driverAvail.dart';
import 'package:hotelcab/hotel_Profile.dart';
import 'package:hotelcab/login.dart';
import 'package:hotelcab/recent_booking.dart';
import 'package:hotelcab/registeration.dart';
import 'home.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const LoginPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const Registration(),
        '/home': (BuildContext context) => const Hotel()
      },
      debugShowCheckedModeBanner: false,
    ));

List<Widget> _pages = [const HomePage(), const Booking(), const Driver()];

class Hotel extends StatefulWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 31, 31),
        title: Center(
            child: Text(
          "HotelCab",
          style: TextStyle(color: Colors.white),
        )),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            tooltip: "Search ",
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: GNav(
          backgroundColor: Colors.grey.shade200,
          tabBackgroundColor: Colors.orange,
          color: Colors.black,
          activeColor: Colors.white,
          tabBorderRadius: 10.0,
          tabMargin: EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
          gap: 5.0,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
              onPressed: () {},
            ),
            GButton(
              icon: Icons.commute_outlined,
              text: "Recent",
              onPressed: () {},
            ),
            GButton(
              icon: Icons.person_outlined,
              text: "Drivers",
              onPressed: () {},
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: Container(child: _pages[_selectedIndex]),
    );
  }
}
