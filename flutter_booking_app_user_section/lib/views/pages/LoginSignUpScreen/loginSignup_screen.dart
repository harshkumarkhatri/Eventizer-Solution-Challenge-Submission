import 'package:flutter/material.dart';
import 'Widget/backgroundCont_widget.dart';
import 'Widget/imageCircle_widget.dart';
import 'Widget/loginButton_widget.dart';
import 'Widget/signUpButton_widget.dart';

class LoginSignUpScreen extends StatefulWidget {
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double dist = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      body: Stack(
        children: [
          backgroundContainers(context),
          imageCircle(context),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [loginButton(context), signupButton(context)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
