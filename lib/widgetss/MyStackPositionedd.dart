import 'package:flutter/material.dart';

class MyStackPosition extends StatelessWidget {
  const MyStackPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Stack Position"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
        body: Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children:<Widget>[
              Container(
                height: 200,
                width: 200,
                color: Colors.amberAccent,
              ),
              Positioned(
                bottom: -50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.cyanAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
