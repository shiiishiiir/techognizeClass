import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CarouselGetWidget extends StatefulWidget {
  const CarouselGetWidget({Key? key}) : super(key: key);

  @override
  State<CarouselGetWidget> createState() => _CarouselGetWidgetState();
}

class _CarouselGetWidgetState extends State<CarouselGetWidget> {
  final List<String> images = [
    "assets/car.jpg",
    "assets/car2.jpg",
    "assets/pp.jpg",
    "assets/cp.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GFAppBar(
          title: Text("GetWidget Carousel"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            GFCarousel(
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              autoPlayAnimationDuration: Duration(seconds: 2),
              height: 400,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              items: images
                  .map((item) => Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
