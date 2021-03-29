import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/GetUserDetails/getUserDetails_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

Widget registerButton_widget(String email, dynamic jsonData, emailHashCode,
    indexOfElement, bool status, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (jsonData['registeredUsers'].length == 0) {
        Get.to(GetUserDetails(
            email, jsonData, emailHashCode, indexOfElement, status, context));
      } else {
        List emailList = [];
        for (int i = 0; i < jsonData['registeredUsers'].length; i++) {
          emailList.add(jsonData['registeredUsers'][i]['email']);
        }
        var loggedInUserEmail = getemail().then((value) {
          print("value is $value");
          print(emailList.contains(value));
          if (emailList.contains(value)) {
            Get.back();
            Get.snackbar("Already registered",
                "You have already registered for this event");
          } else {
            print("email is not present already");
            Get.to(GetUserDetails(email, jsonData, emailHashCode,
                indexOfElement, status, context));
          }
        });
        print(emailList.contains(loggedInUserEmail));
        print(emailList);
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15.0,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(
              14,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            "Register".toUpperCase(),
            style: TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    ),
  );
}

getemail() async {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  String email = await storage.read(key: "email");
  print(email);
  return email;
}
