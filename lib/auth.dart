import 'package:flutter/material.dart';


// final routes: <String, WidgetBuilder>{
//"/":
//};

class auth extends StatelessWidget {
  FileImage image;
  final _scaffoldKey = GlobalKey<ScaffoldState>();



  List _imageList = ['asset/1.png','asset/2.png','asset/3.png','asset/4.png','asset/5.png','asset/6.png','asset/7.png','asset/8.png',];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff1c1b1b),
      appBar: AppBar(
        title: Text("Clean Up"),
        backgroundColor: Color(0xff4bb558),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return new GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .72,
            padding: const EdgeInsets.all(50.0),
            mainAxisSpacing: 30.0,
            crossAxisSpacing: 20.0,
            children: _getTiles(context,_imageList),
          );
        },
      ),
    );
  }
}

List<Widget> _getTiles(context ,List iconList) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < iconList.length; i++) {
    tiles.add(new GridTile(

        child: new GestureDetector(
          //enableFeedback: true,
          child: new Image.asset(iconList[i], fit: BoxFit.cover,),
          onTap: () => Navigator.pushNamed(context, i.toString()),
        )));
  }
  return tiles;
}