import 'package:flutter/material.dart';
class volunteer extends StatefulWidget {
  @override
  _volunteerState createState() => _volunteerState();
}

class _volunteerState extends State<volunteer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer to Clean"),
        backgroundColor: Colors.green,
        
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage("asset/9.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.center)
              ),
            ),
          ),
          //Text(data)
        ],
      ),
    );
  }
}
