import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../../Providers/Providers.dart';

class EmailAuthTest extends StatefulWidget {
  const EmailAuthTest({Key? key}) : super(key: key);

  @override
  State<EmailAuthTest> createState() => _EmailAuthTestState();
}

class _EmailAuthTestState extends State<EmailAuthTest> {
  final _formKey = GlobalKey<FormState>();

  bool isLogIn = false;

  String email = "";
  String password = "";
  String username = "";

  _handleSignUpData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      isLogIn ? signUp(email, password) : signIn(email, password);
    }
  }

  signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Success");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Welcome...")));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AuthDataViewMy()));
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
      appBar: AppBar(
        title: Text("Email/Pass Auth"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.5,
                    child: ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        color: Colors.redAccent,
                        height: 200,
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      color: Colors.red,
                      height: 180,
                      alignment: Alignment.center,
                      child: Text(
                        "Hey Hi!",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    isLogIn
                        ? TextFormField(
                            key: ValueKey("Username"),
                            decoration: InputDecoration(
                              hintText: "Enter Your Username",
                            ),
                            validator: (value) {
                              if (value.toString().length < 3) {
                                return "Username is Small";
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
                    TextFormField(
                      key: ValueKey("Email"),
                      decoration: InputDecoration(
                        hintText: "Enter Your Email",
                      ),
                      validator: (value) {
                        if (!(value.toString().contains("@"))) {
                          return "Invalid Email";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      key: ValueKey("Password"),
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                      ),
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return "Password is Small";
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _handleSignUpData,
                        child: isLogIn ? Text("Sign Up") : Text("Log In"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogIn = !isLogIn;
                        });
                      },
                      child: isLogIn
                          ? Text("Already SignUp? LogIn")
                          : Text("Don't Have an Account? SignUp"),
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
