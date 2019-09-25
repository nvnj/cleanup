import 'package:flutter/material.dart';

class reportIssue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Report an Issue"),

      ),
      body: Container(
          child: Padding(padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(decoration: InputDecoration(
                  hintText: "Name",
                    focusColor: Colors.green
                  
                ),),
                TextField(decoration: InputDecoration(
                  hintText: "Area",
                    focusColor: Colors.green
                ),),
                TextField(decoration: InputDecoration(
                  hintText: "Subject",
                    focusColor: Colors.green,
                ),),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 300.0,
                  ),
                  child: new Scrollbar(
                    child: new SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      reverse: true,
                      child: new TextField(

                        maxLines: null,

                        decoration: InputDecoration(
                          hintText: "Description",
                          focusColor: Colors.green,

                        ),
                      ),
                    ),
                  ),
                ),
          Padding(padding: EdgeInsets.only(bottom: 15.0)),
                RaisedButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>reportResponse()));}
                    ,
                color: Colors.green,
                child: Text("Submit"),)

              ],
            )),

        )
    );


  }
}

class reportResponse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clean Up"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 25.0,bottom: 25.0)),
            Text("Submitted Successfully!",style: TextStyle(color: Colors.green),),
            Padding(padding: EdgeInsets.only(top: 25.0,bottom: 25.0)),
            Text("Your issue has been reported and will be forwarded to concerned authorities"),
            
          ],
        ),
      ),
    );
  }
}

