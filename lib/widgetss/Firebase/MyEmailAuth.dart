import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techognize/widgetss/Firebase/AuthShowData.dart';

class FireEmailAuth extends StatefulWidget {
  const FireEmailAuth({Key? key}) : super(key: key);

  @override
  State<FireEmailAuth> createState() => _FireEmailAuthState();
}

class _FireEmailAuthState extends State<FireEmailAuth> {
  final _formKey = GlobalKey<FormState>();

  bool isLogIn = false;

  String username = "";
  String email = "";
  String password = "";

  _handleSignUpData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      isLogIn ? signUp(email, password) : signIn(email, password);
    }
  }

  signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Success");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Success")));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Success");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Success")));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AuthShowDataFire()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email Auth")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    isLogIn
                        ? TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Your Username",
                            ),
                            validator: (value) {
                              if (value.toString().length < 3) {
                                return "Username is Samll";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                username = value!;
                              });
                            },
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Your Email",
                      ),
                      // validator: (value) {
                      //   if (value.toString().contains("@")) {
                      //     return "Invalid Email";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                      ),
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return "Password is Samll";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _handleSignUpData,
                        child: isLogIn ? Text("Sign Up") : Text("Log In"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogIn = !isLogIn;
                        });
                      },
                      child: isLogIn
                          ? Text("Already Signned Up? Log In!")
                          : Text("Don't have an Account? SignUp!"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
