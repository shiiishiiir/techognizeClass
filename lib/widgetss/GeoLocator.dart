import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MyGeoLocation extends StatefulWidget {
  const MyGeoLocation({Key? key}) : super(key: key);

  @override
  State<MyGeoLocation> createState() => _MyGeoLocationState();
}

class _MyGeoLocationState extends State<MyGeoLocation> {
  Position? positon;
  String address = "My Address";

  fethPosition() async {
    bool serviceEnabled;
    LocationPermission permision;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      Fluttertoast.showToast(msg: "Disabled");
    }

    permision = await Geolocator.checkPermission();
    if (permision == LocationPermission.denied) {
      permision = await Geolocator.requestPermission();
      if (permision == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Location Permission is Denied");
      }
    }

    if (permision == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "Location Permission Denied Forever");
    }
    Position currenPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currenPosition.latitude, currenPosition.longitude);
      Placemark place = placemarks[0];

      setState(() {
        positon = currenPosition;
        address = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Find My Location"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                address,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                positon == null ? "Location" : positon.toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  fethPosition();
                },
                child: Text("Find Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
