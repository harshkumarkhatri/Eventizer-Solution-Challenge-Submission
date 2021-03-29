import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/utils/constants.dart';

Widget aboutTheAppText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      child: Text(
        Constants.aboutTheAppText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.4,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
