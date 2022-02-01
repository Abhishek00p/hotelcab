import 'package:flutter/material.dart';
import 'package:hotelcab/home.dart';

void main() {
  runApp(MaterialApp(
    home: Hotel(),
  ));
}

class Hotel extends StatelessWidget {
  Hotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("HotelCab"),
        actions: [
          TextButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              icon: const Icon(Icons.search),
              label: const Text(""))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              const Text("Number of passanger "),
              Container(
                  width: 300.0,
                  child: ListView(
                    padding: EdgeInsets.all(8.0),
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        child: Text("dd"),
                      ),
                      Container(
                        height: 30.0,
                        child: Text("hh"),
                      ),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              const Text("Customer Govt ID "),
              Container(
                  width: 200.0,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 0.8,
                    ),
                    decoration: InputDecoration(
                      hintText: " + Insert",
                      fillColor: Colors.grey,
                      hoverColor: Colors.amber,
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
