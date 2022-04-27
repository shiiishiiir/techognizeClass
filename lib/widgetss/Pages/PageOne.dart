import 'dart:math';

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: pi/4,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 50,),
                Transform.translate(
                  offset: Offset(80, -40),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 50,),
                Transform.scale(
                  scale: 1.5,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 50,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
