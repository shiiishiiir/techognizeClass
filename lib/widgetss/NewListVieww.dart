import 'package:flutter/material.dart';
import 'package:techognize/widgetss/ListViewTiless.dart';
import 'package:techognize/widgetss/MyGridVieww.dart';

class NewListVieww extends StatelessWidget {
  // const NewListVieww({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("list Tiles with Image"),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyGridVieww()));
                },
                title: Text("Names"),
                subtitle: Text("Subtitle"),
                leading: Image.network(
                    "https://media.istockphoto.com/photos/generic-modern-sports-car-in-concrete-garage-picture-id1307086563?b=1&k=20&m=1307086563&s=170667a&w=0&h=sPx3GPlfoe6NT_ZO4XyAT5eP1QbbUf5rZlSrqQmX2Ig="),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListViewTiless()));
                },
                title: Text("Names"),
                subtitle: Text("Subtitle"),
                leading: Image.network(
                    "https://media.istockphoto.com/photos/generic-modern-sports-car-in-concrete-garage-picture-id1307086563?b=1&k=20&m=1307086563&s=170667a&w=0&h=sPx3GPlfoe6NT_ZO4XyAT5eP1QbbUf5rZlSrqQmX2Ig="),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
