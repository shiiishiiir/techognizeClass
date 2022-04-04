// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techognize/Homepage.dart';
import 'package:techognize/widgetss/ListViewTiless.dart';

void main() {
  runApp(const Shishir());
}
class Shishir extends StatelessWidget {
  const Shishir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewTiless(),
    );
  }
}


