import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:permission/permission.dart';




class nearestBin extends StatefulWidget {
  @override
  _nearestBinState createState() => _nearestBinState();
}

class _nearestBinState extends State<nearestBin> {
  GoogleMapController mapController;

  LatLng _center = const LatLng(45.521563, -122.677433);
  LocationData currentLocation;

  var location = new Location();


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _getLocation() async {
    var permissions = await Permission.getPermissionsStatus([PermissionName.Location]);
    var location = new Location();
    try {
      currentLocation = await location.getLocation();

      print("locationLatitude: ${currentLocation.latitude}");
      print("locationLongitude: ${currentLocation.longitude}");
      setState(
              () {
                _center = LatLng(currentLocation.latitude, currentLocation.longitude);
              });
    } on Exception {
      currentLocation = null;
    }
  }
  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Nearest Bin'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,

          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      );

  }
}