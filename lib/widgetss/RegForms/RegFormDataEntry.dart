import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegFormDataEntryy extends StatefulWidget {
  const RegFormDataEntryy({Key? key}) : super(key: key);

  @override
  State<RegFormDataEntryy> createState() => _RegFormDataEntryyState();
}

class _RegFormDataEntryyState extends State<RegFormDataEntryy> {
  final _formKey = GlobalKey<FormState>();

  bool _secureText = true;

  var name, email, phone, password;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  final firebaseRef = FirebaseDatabase.instance.ref("Registered Users");

  _sendFirebase() {
    if (_formKey.currentState!.validate()) {
      firebaseRef.push().set({
        "Name": nameController.text,
        "Email": emailController.text,
        "Phone": phoneController.text,
        "Password": passwordController.text,
      }).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Successfully Registered")));

        nameController.clear();
        emailController.clear();
        phoneController.clear();
        passwordController.clear();
      }).catchError((onError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("reg Failded")));
      });
    }
  }

  _handleSignUpData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("Name is : ${this.name}");
      print("Email Address is : ${this.email}");
      print("Phone Number is : ${this.phone}");
      print("Password is : ${this.password}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registration Form Details"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Enter Your Name",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Name First!!");
                              }
                            },
                            onSaved: (value) {
                              this.name = value;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Enter Your  Email Address",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Email First!!");
                              }
                            },
                            onSaved: (value) {
                              this.email = value;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "Enter Your Phone Number",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Number First!!");
                              }
                            },
                            onSaved: (value) {
                              this.phone = value;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _secureText,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Enter Your Password",
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _secureText
                                      ? Icons.remove_red_eye
                                      : Icons.security,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _secureText = !_secureText;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Password First!!");
                              }
                            },
                            onSaved: (value) {
                              this.password = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    child: Text("Submit Here"),
                    onPressed: () {
                      _sendFirebase();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
