import 'package:flutter/material.dart';
import 'welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';
import 'dart:async';
import 'photo.dart';
import 'volunteer.dart';
import 'points.dart';
import 'reportissue.dart';
import 'disposaltips.dart';
import 'nearestbin.dart';
import 'schedule.dart';
import 'specialcollect.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        '0':(context)=> schedule(),
        '1':(context)=> photoReport(),
        '2':(context)=> volunteer(),
        '3':(context)=> viewPoints(),
        '4':(context)=> nearestBin(),
        '5':(context)=> disposalTips(),
        '6':(context)=> specialCollection(),
        '7':(context)=> reportIssue()
      },
      color: Colors.blue,
      home: new cleanup(),
    );
  }
}

class cleanup extends StatefulWidget {
  @override
  _cleanupState createState() => _cleanupState();
}

class _cleanupState extends State<cleanup> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new auth()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new welcome()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

