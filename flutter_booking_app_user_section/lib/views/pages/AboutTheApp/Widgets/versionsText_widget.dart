import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/utils/constants.dart';

Widget versionText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 36.0),
    child: Container(
      child: Text(
        Constants.versionsText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.3,
        ),
      ),
    ),
  );
}
