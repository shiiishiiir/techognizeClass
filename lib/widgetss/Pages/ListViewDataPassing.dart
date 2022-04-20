import 'package:flutter/material.dart';

class ListTilesDataPassing extends StatefulWidget {

  var useLists;
  ListTilesDataPassing({required this.useLists});

  @override
  State<ListTilesDataPassing> createState() => _ListTilesDataPassingState();
}

class _ListTilesDataPassingState extends State<ListTilesDataPassing> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Data View"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Hi I am ${widget.useLists}",style: TextStyle(fontSize: 50),),
            ],
          ),
        ),
      ),
    );
  }
}
