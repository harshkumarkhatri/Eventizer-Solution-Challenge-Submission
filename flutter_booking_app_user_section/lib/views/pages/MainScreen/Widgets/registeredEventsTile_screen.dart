import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/RegisteredEvents/registeredEvents_screen.dart';
import 'package:get/get.dart';

Widget registeredEventsTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      'Registered Events',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      Get.back();
      Get.to(RegisteredEvents());
    },
  );
}
