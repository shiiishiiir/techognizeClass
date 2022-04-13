import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyLiquidSwipe extends StatefulWidget {
  const MyLiquidSwipe({Key? key}) : super(key: key);

  @override
  State<MyLiquidSwipe> createState() => _MyLiquidSwipeState();
}

class _MyLiquidSwipeState extends State<MyLiquidSwipe> {

  final pages=[
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.cyan),
    Container(color: Colors.amber),
    Container(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LiquidSwipe(pages: pages),
    );
  }
}
