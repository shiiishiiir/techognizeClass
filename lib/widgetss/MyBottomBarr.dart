import 'package:flutter/material.dart';
import 'package:techognize/widgetss/MyCard.dart';
import 'package:techognize/widgetss/MyExpanded.dart';
import 'package:techognize/widgetss/MyLiquidSwipe.dart';
import 'package:techognize/widgetss/MyStackPositionedd.dart';

class MyBottomBarr extends StatefulWidget {
  const MyBottomBarr({Key? key}) : super(key: key);

  @override
  State<MyBottomBarr> createState() => _MyBottomBarrState();
}

class _MyBottomBarrState extends State<MyBottomBarr> {
  int _currentIndex = 0;

  final _pages = [
    MyExpanded(),
    MyCardView(),
    MyStackPosition(),
    MyLiquidSwipe(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BottomBar"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_sharp), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.add_call), label: "Call"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ],
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              value = _currentIndex;
            });
          },
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
