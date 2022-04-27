import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Text("Navigation Drawer"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _globalKey.currentState!.openDrawer();
                },
                icon: Icon(Icons.menu),
                label: Text("Drawer Button"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _globalKey.currentState!.openEndDrawer();
                },
                icon: Icon(Icons.menu),
                label: Text("Drawer Button"),
              ),
              Dismissible(
                background: Container(color: Colors.red,child: Icon(Icons.delete)),
                key: ValueKey("value"),
                child: ExpansionTile(
                  title: Text("Profile"),
                  leading: Icon(Icons.people),
                  children:<Widget>[
                    Container(color: Colors.greenAccent,height: 50,)
                  ],
                ),
              ),


            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset("assets/car.jpg"),
                  Positioned(
                    left: 30,
                    bottom: 50,
                    child: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/car2.jpg")),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 60,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Text(" Hi! I am BMW"),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Emails"),
                leading: Icon(Icons.mail),
                children:<Widget>[
                  Container(color: Colors.greenAccent,height: 50,)
                ],
              ),
              ExpansionTile(
                title: Text("Record"),
                leading: Icon(Icons.mic),
                children:<Widget>[
                  Container(color: Colors.greenAccent,height: 50,)
                ],
              ),
              ExpansionTile(
                title: Text("Settings"),
                leading: Icon(Icons.build),
                children:<Widget>[
                  Container(color: Colors.greenAccent,height: 50,)
                ],
              ),
              ExpansionTile(
                title: Text("Profile"),
                leading: Icon(Icons.people),
                children:<Widget>[
                  Container(color: Colors.greenAccent,height: 50,)
                ],
              ),

            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset("assets/car.jpg"),
                  Positioned(
                    left: 30,
                    bottom: 50,
                    child: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/car2.jpg")),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 60,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Text(" Hi! I am BMW"),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Emails"),
                leading: Icon(Icons.mail),
                children:<Widget>[
                  Container(color: Colors.greenAccent,height: 50,)
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("Record"),
                leading: Icon(Icons.mic),
                children:<Widget>[
                  Container(color: Colors.greenAccent,height: 50,)
                ],
              ),
              Divider(),
              ExpansionTile(
                title: Text("Settings"),
                leading: Icon(Icons.build),
                children:<Widget>[
                  Container(color: Colors.greenAccent,height: 50,)
                ],
              ),
              ExpansionTile(
                title: Text("Profile"),
                leading: Icon(Icons.people),
                children:<Widget>[
                  Container(color: Colors.greenAccent,height: 50,)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
