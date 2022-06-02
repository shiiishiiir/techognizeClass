import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MaheWidget extends StatefulWidget {
  const MaheWidget({Key? key}) : super(key: key);

  @override
  State<MaheWidget> createState() => _MaheWidgetState();
}

class _MaheWidgetState extends State<MaheWidget> {
  final databaseRef = FirebaseDatabase.instance.ref("Registered Users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Flexible(
            child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                final ShowDatas = snapshot.value.toString();
                return ListTile(
                  title: Text(ShowDatas),
                  trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                );
              },
            ),
          )),
    );
  }
}