import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestAuthPhone extends StatefulWidget {
  const TestAuthPhone({Key? key}) : super(key: key);

  @override
  State<TestAuthPhone> createState() => _TestAuthPhoneState();
}

class _TestAuthPhoneState extends State<TestAuthPhone> {
  TextEditingController phoneController = TextEditingController();

  sendOTP() async {
    String phone = "+88" + phoneController.text.trim();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyOTPScreen(
                      verificationId: verificationId,
                    )));
      },
      verificationCompleted: (credintials) {},
      verificationFailed: (ex) {
        print(ex.code.toString());
        log(ex.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Phone Auth"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                  onPressed: () {
                    sendOTP();
                  },
                  child: Text("Sign In"),
                  color: Colors.indigoAccent),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key, required this.verificationId})
      : super(key: key);
  final String verificationId;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  TextEditingController otpController = TextEditingController();

  verifyOTP() async {
    String otp = otpController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        print("Success");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Success")));
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PhoneAuthHome()));
      }
    } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "OTP Verification",
                counterText: "",
              ),
              maxLength: 6,
              controller: otpController,
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              verifyOTP();
            },
            child: Text("Verify"),
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}

class PhoneAuthHome extends StatefulWidget {
  const PhoneAuthHome({Key? key}) : super(key: key);

  @override
  State<PhoneAuthHome> createState() => _PhoneAuthHomeState();
}

class _PhoneAuthHomeState extends State<PhoneAuthHome> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  _saveUsers() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();

    nameController.clear();
    emailController.clear();

    if (name != "" && email != "") {
      Map<String, dynamic> userData = {"Name": name, "Email": email};
      FirebaseFirestore.instance.collection("Users").add(userData);
      print("Success");
    } else {
      return "fill all the fields";
    }
  }

  Future _exitDialogue() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are You Sure ?"),
        content: Text("Do you really want to exit ?"),
        actions:<Widget>[
          TextButton(onPressed: (){
            SystemNavigator.pop();
          }, child: Text("EXIT")),
          TextButton(onPressed: (){
            Navigator.of(context).pop(false);
          }, child: Text("CANCEL")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        _exitDialogue();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("home"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Input Name",
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Input Email",
                    ),
                  ),
                ],
              )),
            ),
            MaterialButton(
              onPressed: () {
                _saveUsers();
              },
              child: Text("Save"),
              color: Colors.lightGreenAccent,
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Users").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> userMap =
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;

                              return ListTile(
                                title: Text(userMap["Name"]),
                                subtitle: Text(userMap["Email"]),
                                trailing: IconButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("Users")
                                        .doc("GRdToWS5AqTG6OGYrIdI")
                                        .delete();
                                  },
                                  icon: Icon(Icons.delete_forever),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Text("No data");
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
