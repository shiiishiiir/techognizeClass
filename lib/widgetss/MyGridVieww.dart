import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGridVieww extends StatefulWidget {
  const MyGridVieww({Key? key}) : super(key: key);

  @override
  State<MyGridVieww> createState() => _MyGridViewwState();
}

class _MyGridViewwState extends State<MyGridVieww> {
  List<String> names = [
    "Shishir",
    "Abir",
    "Izazul",
    "Mahidul",
    "jamiul",
    "Ehsan",
    "Shishir",
    "Abir",
    "Izazul",
    "Mahidul",
    "jamiul",
    "Ehsan",
    "Shishir",
    "Abir",
    "Izazul",
    "Mahidul",
    "jamiul",
    "Ehsan"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Grid View"),
        ),
        body: Center(
          child: GridView.builder(
              itemCount: names.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Ink.image(
                    image: NetworkImage(
                        "https://source.unsplash.com/random?sig=$index"),
                    fit: BoxFit.cover,
                  ),
                  footer: Center(
                    child: Text(
                      names[index],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
