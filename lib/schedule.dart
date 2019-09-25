import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class schedule extends StatefulWidget {
  schedule({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _scheduleState createState() => new _scheduleState();
}

class _scheduleState extends State<schedule> {

  /*StreamController<List<Map<String, String>>> eventsController =
  new StreamController();



  @override
  void dispose() {
    eventsController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const eventList = [

      {
        'name': 'Event (null location)',
        'location': null,
        'date': '2018-09-27 13:27:00',
        'id': '1',
      },
      // null name, so name will not be displayed
      // but event will be visible in calendar
      {
        'name': null,
        'location': 'Suite 501',
        'date': '2018-09-21 14:35:00',
        'id': '2',
      },
      // null date, so event below will not be visible in calendar
      {
        'name': 'Event null date',
        'location': '1200 Park Avenue',
        'date': null,
        'id': '3',
      },
      // null id, so event below will not be visible in calendar
      {
        'name': 'Event null id',
        'location': 'Grand Ballroom',
        'date': '2018-08-27 13:27:00',
        'id': null,
      },
      {
        'name': 'Event 4',
        'location': 'Grand Ballroom',
        'date': '2018-08-27 13:27:00',
        'id': '4',
      },
      {
        'name': 'Event 5',
        'location': 'Suite 501',
        'date': '2018-10-21 14:35:00z',
        'id': '5',
      },
      {
        'name': 'Event 6',
        'location': '1200 Park Avenue',
        'date': '2018-08-22 05:49:00',
        'id': '6',
      },
      {
        'name':
        'Handle really long names in the event list so it does not break',
        'location': '1200 Park Avenue',
        'date': '2018-10-24 05:49:00',
        'id': '7',
      },
      {
        'name': 'Event 8',
        'location':
        'Handle really long locations in the event list so it does not break',
        'date': '2018-10-24 05:49:00z',
        'id': '8',
      },
    ];

    final theme = ThemeData.dark().copyWith(
//      primaryColor: Colors.white,
//      accentColor: Colors.lightBlue,
//      canvasColor: Colors.white,
//      backgroundColor: Colors.lightBlue,
//      dividerColor: Colors.blueGrey,
      textTheme: ThemeData.dark().textTheme.copyWith(
        display1: TextStyle(
          fontSize: 21.0,
        ),
        subhead: TextStyle(
          fontSize: 14.0,
          color: Colors.blueGrey,
        ),
        headline: TextStyle(
          fontSize: 18.0,
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        title: TextStyle(
          fontSize: 14.0,
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
      ),
      accentTextTheme: ThemeData.dark().accentTextTheme.copyWith(
        body1: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        title: TextStyle(
          fontSize: 21.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        display1: TextStyle(
          fontSize: 21.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );*/
  List<DateTime> presentDates = [
    DateTime(2019, 2, 1),
    DateTime(2019, 2, 3),
    DateTime(2019, 2, 4),
    DateTime(2019, 2, 5),
    DateTime(2019, 2, 6),
    DateTime(2019, 2, 9),
    DateTime(2019, 2, 10),
    DateTime(2019, 2, 11),
    DateTime(2019, 2, 15),
    DateTime(2019, 2, 11),
    DateTime(2019, 2, 15),
  ];
  List<DateTime> absentDates = [

    DateTime(2019, 2, 2),
    DateTime(2019, 2, 7),
    DateTime(2019, 2, 8),
    DateTime(2019, 2, 12),
    DateTime(2019, 2, 13),
    DateTime(2019, 2, 14),
    DateTime(2019, 2, 16),
    DateTime(2019, 2, 17),
    DateTime(2019, 2, 18),
    DateTime(2019, 2, 17),
    DateTime(2019, 2, 18),
  ];

    DateTime _currentDate2 = DateTime.now();
    static Widget _presentIcon(String day) => Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(1000),
        ),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
    static Widget _absentIcon(String day) => Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(1000),
        ),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );

    EventList<Event> _markedDateMap = new EventList<Event>(
      events: {},
    );

    CalendarCarousel _calendarCarouselNoHeader;

    var len = 9;
    double cHeight;

    @override
    Widget build(BuildContext context) {
      cHeight = MediaQuery.of(context).size.height;
      for (int i = 0; i < len; i++) {
        _markedDateMap.add(
          presentDates[i],
          new Event(
            date: presentDates[i],
            title: 'Event 5',
            icon: _presentIcon(
              presentDates[i].day.toString(),
            ),
          ),
        );}

      for (int i = 0; i < len; i++) {
        _markedDateMap.add(
          absentDates[i],
          new Event(
            date: absentDates[i],
            title: 'Event 5',
            icon: _absentIcon(
              absentDates[i].day.toString(),
            ),
          ),
        );
      }


      _calendarCarouselNoHeader = CalendarCarousel<Event>(
        height: cHeight * 0.54,
        //weekdayTextStyle: ,
        todayButtonColor: Colors.blue[200],
        markedDatesMap: _markedDateMap,
        markedDateShowIcon: true,
        markedDateIconMaxShown: 1,
        markedDateMoreShowTotal:
        null, // null for not showing hidden events indicator
        markedDateIconBuilder: (event) {
          return event.icon;
        },
      );

      Widget markerRepresent(Color color, String data) {
        return new ListTile(
          leading: new CircleAvatar(
            backgroundColor: color,
            radius: cHeight * 0.022,
          ),
          title: new Text(
            data,
          ),
        );
      }

      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Schedule"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _calendarCarouselNoHeader,
              markerRepresent(Colors.red, "Wet waste"),
              markerRepresent(Colors.green, "Dry Waste"),
              markerRepresent(Colors.yellow, "Special Collection"),
            ],
          ),
        ),
      );
    }


  }