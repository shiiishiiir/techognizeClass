import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techognize/widgetss/Firebase/OTPVerify.dart';

class MyPhoneAuthFire extends StatefulWidget {
  const MyPhoneAuthFire({Key? key}) : super(key: key);

  @override
  State<MyPhoneAuthFire> createState() => _MyPhoneAuthFireState();
}

class _MyPhoneAuthFireState extends State<MyPhoneAuthFire> {
  TextEditingController phoneController = TextEditingController();

  sendOTP() async {
    String phone = "+88" + phoneController.text.trim();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendCode) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OTPVerify(
          verificationId: verificationId,
        )));
      },
      verificationCompleted: (credintials) {},
      verificationFailed: (ex) {
        print(ex.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Firebase Phone Log In"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Phone LogIn",
                ),
                keyboardType: TextInputType.text,
                controller: phoneController,
              ),
              MaterialButton(
                  onPressed: () {
                    sendOTP();
                  },
                  child: Text("Sign In"),
                  color: Colors.indigoAccent),
            ],
          ),
        ),
      ),
    );
  }
}
