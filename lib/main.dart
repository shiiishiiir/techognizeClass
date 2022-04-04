import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const Shishir());
}
class Shishir extends StatelessWidget {
  const Shishir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyanAccent,
          body: Center(
            child: Container(
              child: Center(
                child: Text(
                  "This is Container",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: Colors.red,
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}


