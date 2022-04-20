import 'package:flutter/material.dart';
import 'package:techognize/widgetss/ListViewTiless.dart';
import 'package:techognize/widgetss/MyExpanded.dart';
import 'package:techognize/widgetss/MyGridVieww.dart';
import 'package:techognize/widgetss/Pages/PageOne.dart';
import 'package:techognize/widgetss/Pages/PageTwo.dart';

class MyTabBarr extends StatelessWidget {
  const MyTabBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab Bars"),
            bottom: TabBar(
              tabs: <Tab>[
                Tab(
                  icon: Icon(Icons.list),
                ),
                Tab(
                  icon: Icon(Icons.grid_view),
                ),
                Tab(
                  icon: Icon(Icons.android),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListViewTiless(),
              MyGridVieww(),
              MyExpanded(),
            ],
          ),
        ),
      ),
    );
  }
}
