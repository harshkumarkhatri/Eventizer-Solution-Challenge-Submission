import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/utils/constants.dart';

Widget overwrittenText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Container(
      child: Text(
        Constants.overwrittenText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
