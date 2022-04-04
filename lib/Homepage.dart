import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("This Is App Bar"),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20, width: 10),
              Text("This is Column"),
              SizedBox(height: 10, width: 10),
              Container(
                child: Center(
                  child: Text(
                    "This is Container",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.red,
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width/2,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Container(
                child: Center(
                  child: Text(
                    "This is 2nd Container",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.red,
                height: 200.0,
                width: 200.0,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Container(
                child: Center(
                  child: Text(
                    "This is 3rd Container",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.red,
                height: 200.0,
                width: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
