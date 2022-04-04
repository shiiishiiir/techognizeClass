import 'package:flutter/material.dart';

class ListViewTiless extends StatelessWidget {
  const ListViewTiless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("List View and List Tiles"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Techognize Training"),
              subtitle: Text("A fresh flutter course for beginers"),
              leading: Icon(Icons.people_alt_sharp),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera),
              ),
            ),
            ListTile(
              title: Text("Techognize Training"),
              subtitle: Text("A fresh flutter course for beginers"),
              leading: Icon(Icons.people_alt_sharp),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera),
              ),
            ),
            ListTile(
              title: Text("Techognize Training"),
              subtitle: Text("A fresh flutter course for beginers"),
              leading: Icon(Icons.people_alt_sharp),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera),
              ),
            ),
            ListTile(
              title: Text("Techognize Training"),
              subtitle: Text("A fresh flutter course for beginers"),
              leading: Icon(Icons.people_alt_sharp),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
