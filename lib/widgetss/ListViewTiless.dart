import 'package:flutter/material.dart';
import 'package:techognize/widgetss/Pages/ListViewDataPassing.dart';

class ListViewTiless extends StatefulWidget {
  const ListViewTiless({Key? key}) : super(key: key);

  @override
  State<ListViewTiless> createState() => _ListViewTilessState();
}

class _ListViewTilessState extends State<ListViewTiless> {
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
          title: Text("List View and List Tiles"),
        ),
        body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(names[index]),
                    leading: CircleAvatar(
                      child: Text(names[index][0]),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListTilesDataPassing(
                                    useLists: names[index],
                                  )));
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
