import 'dart:async';

import 'package:flutter/material.dart';
import 'package:techognize/widgetss/MyTabBar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(
          seconds: 5,
        ),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyTabBarr()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blueAccent.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.shade700,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.android, size: 70),
              ),
              Text(
                "Splash Screen",
                style: TextStyle(
                  color: Colors.blueGrey[600],
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.blueGrey.shade900,
                      blurRadius: 10,
                      offset: Offset(4, 4),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  color: Colors.black54,
                  strokeWidth: 6,
                ),
              ),
              SizedBox(
                height: 10,
                child: LinearProgressIndicator(
                  color: Colors.black54,
                ),
              ),
              SpinKitHourGlass(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
