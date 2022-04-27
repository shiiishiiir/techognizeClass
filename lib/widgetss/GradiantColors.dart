import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGradiant extends StatefulWidget {
  const MyGradiant({Key? key}) : super(key: key);

  @override
  State<MyGradiant> createState() => _MyGradiantState();
}

class _MyGradiantState extends State<MyGradiant> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Gradiant Color")),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(  //Radial//Sweep
                    colors: [
                      Colors.red,
                      Colors.green,
                      Colors.purple,
                      Colors.blueAccent
                    ],
                    // begin: Alignment.topRight,
                    // end: Alignment.bottomLeft,
                    // tileMode: TileMode.repeated,
                    stops: [0.2, 0.3],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.red,
                      Colors.green,
                      Colors.purple,
                      Colors.blueAccent
                    ],
                    // focal: Alignment.center,
                    // tileMode: TileMode.repeated,
                    stops: [0.2, 0.3],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
