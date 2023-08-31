// ignore_for_file: avoid_unnecessary_containers

import 'package:firebasetestingapp/firebaseauth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../main.dart';

class Verify_OTP_Page extends StatefulWidget {
  String verificationid;
  String Mobile_Number;
  Verify_OTP_Page(this.verificationid, this.Mobile_Number);

  @override
  State<Verify_OTP_Page> createState() => _Verify_OTP_PageState();
}

class _Verify_OTP_PageState extends State<Verify_OTP_Page> {
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 20,
            // backgroundColor: Icon_Them_Color,
            child: CircleAvatar(
              radius: 19,
              // backgroundColor: App_Baground_Color,
              child: Icon(
                Icons.arrow_back,
                size: 25,
                //  color: Icon_Them_Color,
              ),
            ),
          ),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(20),
                // alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            //   color: Text_Title_Color
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {},
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text:
                                  'Enter the 6-digit OTP sent to your registered mobile number',
                              style: TextStyle(
                                  // color: Text_Title_Color,
                                  // fontSize: Text_Hint_Size
                                  )),
                          TextSpan(
                            text: ' +${widget.Mobile_Number}',
                            style: TextStyle(
                                // color: Icon_Them_Color,
                                // fontSize: Text_Hint_Size
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                          ),
                        ])),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: GestureDetector(
                              child: PinCodeTextField(
                                controller: otpcontroller,
                                enablePinAutofill: true,
                                useExternalAutoFillGroup: true,
                                enabled: true,
                                autoFocus: true,
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                    // fontSize: Text_Title_Size,
                                    // color: Text_Title_Color
                                    ),
                                //  fontWeight: FontWeight.w600),
                                length: 6,
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,

                                  activeFillColor:
                                      Color.fromARGB(255, 134, 134, 134),

                                  // disabledColor: Colors.grey,
                                  // activeColor: App_Baground_Color,

                                  // selectedColor: Icon_Them_Color,
                                  inactiveColor:
                                      Color.fromARGB(255, 128, 128, 128),
                                  // selectedFillColor: App_Baground_Color,

                                  fieldWidth: 40,
                                  fieldHeight: 43,
                                  borderRadius: BorderRadius.circular(10),
                                  borderWidth: 0,
                                ),
                                cursorColor: Color.fromARGB(255, 43, 43, 43),
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: false,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    // currentText = value;
                                  });
                                },
                                onCompleted: (verificationCode) async {
                                  setState(() {
                                    // show_loading = true;
                                  });
                                  final response = await firebase_varification()
                                      .verifyCode(widget.verificationid,
                                          verificationCode, context);
                                  print(response);
                                  if (response!["status"] != "success") {
                                    setState(() {
                                      // show_loading = false;
                                    });

                                    // Show_Dialoge().if_error_showdialoge(
                                    //     context, response["errormessage"]);
                                  } else {
                                    // SharedPreferences sharedPreferences =
                                    //     await SharedPreferences.getInstance();
                                    // final GetUserDetailsWithMobileNumber =
                                    //     await userdetails_api()
                                    //         .GetUserDetailsWithMobileNumber(
                                    //             "${widget.Mobile_Number}",
                                    //             context);
                                    // print(GetUserDetailsWithMobileNumber);

                                    setState(() {
                                      // show_loading = false;
                                    });
                                    // if (GetUserDetailsWithMobileNumber ==
                                    //     null) {
                                    //   Navigator.of(context).pop();
                                    //   await Show_Dialoge().if_error_showdialoge(
                                    //       context,
                                    //       "No user is registred with this mobilenumber.");
                                    // } else if (GetUserDetailsWithMobileNumber !=
                                    //         null &&
                                    //     GetUserDetailsWithMobileNumber.length >=
                                    //         2) {
                                    //   print("Multiple account exists");
                                    //   await sharedPreferences.setBool(
                                    //       "userislogin", true);
                                    //   await sharedPreferences.setBool(
                                    //       "multipleaccountselected", false);

                                    // Navigator.pushAndRemoveUntil(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Multiple_Account_Details(
                                    //               "SELECT_ACCOUNT")),
                                    //   (Route<dynamic> route) => false,
                                    // );
                                    // } else {
                                    //   await sharedPreferences.setBool(
                                    //       "multipleaccountselected", true);
                                    //   await sharedPreferences.setBool(
                                    //       "userislogin", true);

                                    //   Navigator.pushAndRemoveUntil(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Home_page()),
                                    //     (Route<dynamic> route) => false,
                                    //   );
                                    // }
                                  }
                                },
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Did not receive OTP ?",
                                style: TextStyle(
                                    // color: Text_Hint_Color,
                                    // fontSize: Text_Title_Size,
                                    ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () async {
                                  // Show_Dialoge().Loading_Showdialogue(
                                  //     context, "Sending OTP...");
                                  // await Signin_signup_API().sendOTPToEmail(
                                  //     widget.Fullname,
                                  //     widget.Emailid,
                                  //     "RESEND",
                                  //     context);
                                },
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                      // color: Icon_Them_Color,
                                      // fontSize: Text_Title_Size,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]))),
        // if (show_loading) Loadingwidget(context, "Verifying OTP...")
      ]),
    );
  }
}
