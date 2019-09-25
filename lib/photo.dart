import 'dart:async';
import 'dart:io';

//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart' show join;
//import 'package:path_provider/path_provider.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:exif/exif.dart';

class photoReport extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Photo and Report"),

      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _camera,
                child: Text('Take Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: _gallery,//_upload,
                child: Text('Upload Image'),
              )
            ],
          ),
          file == null
              ? Text('No Image Selected')
              : Image.file(file,width: 400,height: 400,),
          RaisedButton(
              onPressed: null,
          child: Text("Submit"),
            color: Colors.green,
          ),


        ],

      ),

    );
  }
}

File file;

void _camera() async {
  file = await ImagePicker.pickImage(source: ImageSource.camera);
  //file = await ImagePicker.pickImage(source: ImageSource.gallery);
}
void _gallery() async {
  //file = await ImagePicker.pickImage(source: ImageSource.camera);
  file = await ImagePicker.pickImage(source: ImageSource.gallery);
}
//class TakePictureScreen extends StatefulWidget {
//
//  final CameraDescription camera;
//
//  const TakePictureScreen({
//    Key key,
//    @required this.camera,
//  }) : super(key: key);
//
//  @override
//  _TakePictureScreenState createState() => _TakepictureScreenState();
//}
//
//class _TakepictureScreenState extends State<TakePictureScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}

