import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthDataViewMy extends StatefulWidget {
  const AuthDataViewMy({Key? key}) : super(key: key);

  @override
  State<AuthDataViewMy> createState() => _AuthDataViewMyState();
}

class _AuthDataViewMyState extends State<AuthDataViewMy> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "hi !  " + user.email! + "\n Welcome to Your App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("have a nice day")));
                },
                child: Text("Sign Out")),
          ],
        ),
      ),
    );
  }
}
