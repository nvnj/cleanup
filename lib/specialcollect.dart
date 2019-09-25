import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class specialCollection extends StatelessWidget {

  final wasteType = {"Wet waste": 1,"Dry waste": 2};
  var values;
   TextEditingController waste;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Special Collection"),
        backgroundColor: Colors.green,
      ),
      body:SingleChildScrollView(
        child:Padding(padding: EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            DropDownField(
              textStyle: TextStyle(color: Colors.white),
              controller: waste,
              value: values,

              hintText: "Type of Waste",

              items: wasteType.keys.toList(),
              onValueChanged:(dynamic newValue){
                values= newValue;
                print(values);
              },


            ),
          SizedBox(height: 25),
//            TextField(
//              decoration: InputDecoration(
//                hintText: "Type of Waste"
//              ),
//            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  hintText: "Approx. Weight",
                suffixText: "kg     ",
              ),
            ),
//            TextField(
//              keyboardType: TextInputType.datetime,
//              decoration: InputDecoration(
//                  hintText: "Date of Collection"
//              ),
//            ),
            DateTimeField(format: DateFormat("dd-MM-yyyy"),
            decoration: InputDecoration(
              hintText: "Date of Collection"
            ),
            onShowPicker: (context, currentValue){
              return showDatePicker(context: context,
                  initialDate: currentValue??DateTime.now(), 
                  firstDate: DateTime(2000), 
                  lastDate: DateTime(2100));
            },),
            TextField(
              decoration: InputDecoration(
                  hintText: "PickUp Point"
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  hintText: "Phone No.",
              ),
            ),SizedBox(height: 25),
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>specialResponse()));},
            child: Text("Submit"),
            color: Colors.green,)
          ],
        ),
      ),
    ));
  }
}

class specialResponse extends StatelessWidget {
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
            Text("Your pick up will be scheduled"),

          ],
        ),
      ),
    );
  }
}
