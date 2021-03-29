import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget registerForEventsTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      'Register for Events',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      Get.back();
    },
  );
}
