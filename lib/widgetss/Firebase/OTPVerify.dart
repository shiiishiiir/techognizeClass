import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techognize/widgetss/Firebase/FirePhoneVerifiedHome.dart';

class OTPVerify extends StatefulWidget {
  const OTPVerify({Key? key, required this.verificationId}) : super(key: key);
  final String verificationId;

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
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

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => FireHomeStore()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "OTP Verification",
                counterText: "",
              ),
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            MaterialButton(
                onPressed: () {verifyOTP();},
                child: Text("Submit"),
                color: Colors.indigoAccent),
          ],
        ),
      ),
    );
  }
}
