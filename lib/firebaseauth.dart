import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasetestingapp/verifyotp.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../main.dart';
import 'package:firebasetestingapp/newclass.dart';

class firebase_varification {
  FirebaseAuth auth = FirebaseAuth.instance;
  verifyNumber(ccode, phone_Controller_, context) async {
    print("ccode : $ccode");
    print("phone_Controller_ : $phone_Controller_");
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      // Handle timeout
    };
    await auth.verifyPhoneNumber(
      phoneNumber: '+' '${ccode}' '${phone_Controller_}',
      timeout: Duration(seconds: 60),
      verificationFailed: (exception) async {
        print("exception  : ${exception.message}");

        print("verification failed");
        // show_loading = false;
        // Show_Dialoge().if_error_showdialoge(context, exception.message);
      },
      codeSent: (String? verificationID, int? resendToken) async {
        print("codesent for varification and otp page  ");

        // show_loading = false;

        await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Verify_OTP_Page(
                verificationID!, "${ccode}${phone_Controller_}")));
      },
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
    );
  }

  verifyCode(verificationID, verificationCode, context) async {
    Map response = {};
    print("verificationID : $verificationID");
    PhoneAuthCredential credential = await PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: verificationCode);
    await auth.signInWithCredential(credential).then((value) async {
      print("firebase verified successfully");
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print("fcmToken : $fcmToken");
      print("newclass.age : ${newclass().age}");

      response = {"status": "success"};
    }).catchError((e) {
      print("error : $e");
      response = {"status": "error", "errormessage": e.message.toString()};
    });
    return response;
  }
}
