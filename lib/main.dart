// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techognize/Homepage.dart';
import 'package:techognize/SplashScreen.dart';
import 'package:techognize/widgetss/ListViewTiless.dart';
import 'package:techognize/widgetss/MyCard.dart';
import 'package:techognize/widgetss/MyExpanded.dart';
import 'package:techognize/widgetss/MyGridVieww.dart';
import 'package:techognize/widgetss/MyLiquidSwipe.dart';
import 'package:techognize/widgetss/MyPageView.dart';
import 'package:techognize/widgetss/MyStackPositionedd.dart';
import 'package:techognize/widgetss/MyTabBar.dart';
import 'package:techognize/widgetss/NewListVieww.dart';

void main() {
  runApp(const Shishir());
}
class Shishir extends StatelessWidget {
  const Shishir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


