import 'package:flutter/material.dart';
import 'package:techognize/widgetss/Pages/PageOne.dart';
import 'package:techognize/widgetss/Pages/PageThree.dart';
import 'package:techognize/widgetss/Pages/PageTwo.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {

  PageController _controller=PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Page View "),
        ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
      ),
    );
  }
}
