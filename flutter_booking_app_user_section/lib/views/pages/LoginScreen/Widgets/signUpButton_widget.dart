import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/SignUpScreen/signUp_screen.dart';
import 'package:get/get.dart';

Widget signUpButton() {
  return GestureDetector(
    onTap: () {
      Get.off(SignUpScreen());
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 58.0, top: 25),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.orange[400],
              Colors.orange,
              Colors.orange[600],
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.6,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
