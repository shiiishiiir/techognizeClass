import 'package:flutter/material.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50),),
          ),
          child: Container(
            height: 200,
            width: 200,
          ),
        ),
      ),
    ));
  }
}
