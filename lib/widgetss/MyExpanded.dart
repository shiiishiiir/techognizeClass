import 'package:flutter/material.dart';

class MyExpanded extends StatelessWidget {
  const MyExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Expanded Widget"),
        ),
        body: Column(
          children:<Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.cyanAccent,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.amberAccent,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blueAccent,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
