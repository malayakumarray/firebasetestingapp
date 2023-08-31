import 'package:firebasetestingapp/firebaseauth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebasetestingapp/newclass.dart';

import '../main.dart';

class Mobile_Number_Page extends StatefulWidget {
  const Mobile_Number_Page({super.key});

  @override
  State<Mobile_Number_Page> createState() => _Mobile_Number_PageState();
}

class _Mobile_Number_PageState extends State<Mobile_Number_Page> {
  bool show_terms_of_service = false;
  String? Mobile_Number;
  String? Country_Code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Hero(
          tag: "Forword_Tag",
          child: CircleAvatar(
            radius: 20,
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
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
                      'Mobile Number',
                      style: TextStyle(
                          // fontSize: Text_Heading_size,
                          // fontWeight: FontWeight.w500,
                          // color: Text_Title_Color
                          ),
                    ),
                  ),
                  Container(
                      child: Text(
                    "Enter Your Mobile Number Which Is Already Registered On Suresign.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  IntlPhoneField(
                    disableLengthCheck: false,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    dropdownTextStyle: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                    autofocus: true,
                    // controller: phoneController,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.only(top: 16, bottom: 16),
                        labelStyle: const TextStyle(fontSize: 7),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide()),
                        //   fillColor: Text_Title_Color,
                        //  labelText: 'Phone Number',

                        errorText: "ttt",
                        errorStyle: TextStyle(
                          color: Colors.transparent,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    initialCountryCode: 'IN',
                    onChanged: (phone) async {
                      setState(() {
                        Mobile_Number = phone.number.toString();
                        Country_Code =
                            phone.countryCode.toString().replaceAll("+", "");
                      });
                      print(Mobile_Number);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          //  checkColor: Icon_Them_Color,
                          // activeColor: App_Baground_Color,
                          value: show_terms_of_service,
                          onChanged: (value) {
                            setState(() {
                              show_terms_of_service = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {},
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: 'I accept the',
                                    style: TextStyle(
                                        //     color: Text_Title_Color,
                                        //fontSize: Text_Hint_Size
                                        )),
                                TextSpan(
                                  text: ' Privacy Policy',
                                  style: TextStyle(
                                      //color: Icon_Them_Color
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      // Uri url = Uri.parse(
                                      //     "https://thereach.app/termsofuse");
                                      // if (await canLaunch(
                                      //     "https://thereach.app/termsofuse")) {
                                      //   await launch(
                                      //       "https://thereach.app/termsofuse");
                                      // } else {
                                      //   throw 'Could not launch $url';
                                      //   }
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => View_On_Web(
                                      //             Title: "Terms Of Use ",
                                      //             url_link:
                                      //                 "https://thereach.app/termsofuse")));
                                      // Single tapped.
                                    },
                                ),
                                TextSpan(
                                    text: ' and',
                                    style: TextStyle(
                                        // color: Text_Title_Color,
                                        // fontSize: Text_Hint_Size
                                        )),
                                TextSpan(
                                  text: ' Terms Of Service',
                                  style: TextStyle(
                                      // color: Icon_Them_Color
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      // Uri url = Uri.parse(
                                      //     "https://thereach.app/termsofuse");
                                      // if (await canLaunch(
                                      //     "https://thereach.app/termsofuse")) {
                                      //   await launch(
                                      //       "https://thereach.app/termsofuse");
                                      // } else {
                                      //   throw 'Could not launch $url';
                                      //   }
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => View_On_Web(
                                      //             Title: "Terms Of Use ",
                                      //             url_link:
                                      //                 "https://thereach.app/termsofuse")));
                                      // Single tapped.
                                    },
                                ),
                                TextSpan(
                                    text:
                                        ' to continue with the usage of the Suresign app.',
                                    style: TextStyle(
                                        // color: Text_Hint_Color, fontSize: 12
                                        )),
                              ])),
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      newclass().age = "twenty";
                      print("starting screen : ${newclass().age}");
                      // if (show_terms_of_service) if (Mobile_Number != null &&
                      //     Mobile_Number!.length > 7) {
                      //   setState(() {
                      //     // show_loading = true;
                      //   });
                      await firebase_varification().verifyNumber(
                          Country_Code, Mobile_Number.toString(), context);
                      // } else {
                      // Show_Dialoge().if_error_showdialoge(context,
                      //     "You have enter an invalid mobile number ,please enter a valid mobile number to continue. ");
                      // print("object");
                      // }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomRight,
                        // colors: show_terms_of_service
                        //     ? [
                        //         Color.fromARGB(255, 105, 211, 109),
                        //         Icon_Them_Color,
                        //         Icon_Them_Color,
                        //       ]
                        //     : [
                        //         Light_Icon_Them_Color,
                        //         Light_Icon_Them_Color
                        //       ]),
                        color: Color.fromARGB(255, 0, 80, 233),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // width: MediaQuery.of(context).size.width * 0.7,
                      height: 43,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            letterSpacing: 1,
                            //  fontSize: Text_Title_Size,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //if (show_loading) Loadingwidget(context, "Sending OTP...")
        ],
      ),
    );
  }
}
