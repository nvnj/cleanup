import 'package:flutter/material.dart';
import 'auth.dart';



class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Color(0xff1c1b1b),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            //child: Image.asset("cleanup"),
          ),
          new RaisedButton(
            color: Color(0xff4bb558),
            child: Text("Get Started",
              style: TextStyle(
                  color: Colors.white
              ),),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) =>  auth()),
              );
            },
          )
        ],

      ),
    );
  }
}
