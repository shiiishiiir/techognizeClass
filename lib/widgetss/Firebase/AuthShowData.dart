import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthShowDataFire extends StatefulWidget {
  const AuthShowDataFire({Key? key}) : super(key: key);

  @override
  State<AuthShowDataFire> createState() => _AuthShowDataFireState();
}

class _AuthShowDataFireState extends State<AuthShowDataFire> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth Data Show or Fetch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi!  " + user.email! + "\n Welcome",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("See You Again")));
              },
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
