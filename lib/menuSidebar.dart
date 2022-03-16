import 'package:flutter/material.dart';
import 'package:hotelcab/driverAvail.dart';
import 'package:hotelcab/hotel_Profile.dart';
import 'package:hotelcab/main.dart';
import 'package:hotelcab/recent_booking.dart';

class navigationD extends StatelessWidget {
  navigationD({Key? key}) : super(key: key);

  final mypading = EdgeInsets.symmetric(horizontal: 20);

  var _aut;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.deepOrangeAccent,
        child: ListView(
          padding: mypading,
          children: [
            SizedBox(
              height: 50,
            ),
            myMenuItem(
                text: "home",
                icon: Icons.home,
                onclicked: () => selectedItem(context, 0)),
            SizedBox(
              height: 16,
            ),
            myMenuItem(
                text: "Recent Booking",
                icon: Icons.car_rental,
                onclicked: () => selectedItem(context, 1)),
            SizedBox(
              height: 16,
            ),
            myMenuItem(
                text: "Drivers Availability",
                icon: Icons.person,
                onclicked: () => selectedItem(context, 2)),
            SizedBox(
              height: 16,
            ),
            myMenuItem(
                text: "Hotel Profile",
                icon: Icons.account_balance,
                onclicked: () => selectedItem(context, 3)),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

Widget myMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onclicked,
}) {
  final color = Colors.black;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        )),
    onTap: onclicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => Hotel()));
      break;
    case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserInformation()));
      break;
    case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Driver()));
      break;
    case 3:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Hotel_Profile()));
      break;
  }
}
