import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/utils/constants.dart';

Widget editYourUserNameText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Text(
      Constants.editYourUserNameText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
