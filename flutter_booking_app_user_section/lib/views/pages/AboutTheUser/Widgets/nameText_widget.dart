import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget nameText_widget(User user) {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
      bottom: 15,
      left: 4,
      right: 4,
    ),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(
        14,
      ),
    ),
    child: Text(
      user.displayName == "" || user.displayName == null
          ? "Name:- " + "No display name found"
          : "Name:- " + user.displayName,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
