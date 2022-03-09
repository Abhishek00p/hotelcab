import 'package:flutter/material.dart';
import 'package:hotelcab/driverAvail.dart';
import 'package:hotelcab/hotel_Profile.dart';
import 'package:hotelcab/recent_booking.dart';
import 'home.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Hotel()));

List<Widget> _pages = [HomePage(), Booking(), Driver(), Hotel_Profile()];

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
        backgroundColor: Colors.greenAccent,
        title: Center(child: Text("HotelCab")),
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
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
            onPressed: () {},
          ),
          GButton(
            icon: Icons.favorite,
            text: "Recent Booking",
            onPressed: () {},
          ),
          GButton(
            icon: Icons.book,
            text: "Drivers Availability",
            onPressed: () {},
          ),
          GButton(
            icon: Icons.book,
            text: "Hotel Profile",
            onPressed: () {},
          )
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      )),
      body: Container(child: _pages[_selectedIndex]),
    );
  }
}
