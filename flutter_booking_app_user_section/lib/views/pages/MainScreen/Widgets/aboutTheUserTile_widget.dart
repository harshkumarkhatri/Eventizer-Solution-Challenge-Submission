import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/AboutTheUser/aboutTheUser_screen.dart';
import 'package:get/get.dart';

Widget aboutTheUserTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      'About the User',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      Get.back();
      Get.to(AboutTheUser());
    },
  );
}
