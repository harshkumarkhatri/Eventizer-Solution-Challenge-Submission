import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/utils/impData.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Widget submitButton_widget(_formKey, status, jsonData, email, indexOfElement,
    emailHashCode, userCity, userState, userContactNumber, context) {
  return GestureDetector(
    onTap: () {
      if (_formKey.currentState.validate()) {
        status
            ? statusTrue(email, jsonData, indexOfElement, emailHashCode,
                userCity, userState, userContactNumber)
            : statusFalse(email, jsonData, indexOfElement, emailHashCode,
                userCity, userState, userContactNumber);
        Get.back();
        Get.back();
        Get.snackbar("Registered", "Thank you for registering!!",
            snackPosition: SnackPosition.BOTTOM,
            borderColor: Colors.orange,
            borderWidth: 2,
            colorText: Colors.orange,
            backgroundColor: Colors.black,
            maxWidth: MediaQuery.of(context).size.width);
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
            "Submit".toUpperCase(),
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

statusTrue(email, jsonData, indexOfElement, emailHashCode, userCity, userState,
    userContactNumber) async {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  String userEmail = await storage.read(key: "email");
  List registeredUsers = jsonData["registeredUsers"] ?? [];
  registeredUsers.add({
    "email": userEmail,
    "registeredAt": DateTime.now(),
    "city": userCity,
    "state": userState,
    "userContactNumber": userContactNumber
  });

  final demoThing =
      await Firestore.instance.collection("eventList").doc(email).update({
    "${indexOfElement}_${emailHashCode}": {
      "fullUserName": jsonData["fullUserName"],
      "contactEmail": jsonData["contactEmail"],
      "phoneNumber": jsonData["phoneNumber"],
      "eventState": jsonData["eventState"],
      "eventCity": jsonData["eventCity"],
      "eventType": jsonData["eventType"],
      "expectedAudience": jsonData["expectedAudience"],
      "date": jsonData["date"],
      "time": jsonData["time"],
      "eventStatus": jsonData["eventStatus"],
      "eventName": jsonData["eventName"],
      "eventURL": jsonData["eventURL"],
      "registeredUsers": registeredUsers,
    },
  });
  final userData =
      await FirebaseFirestore.instance.collection("users").doc(userEmail).get();
  List userRegisteredForThisEvent = userData.data()['registeredEvents'] ?? [];
  userRegisteredForThisEvent.add({
    "fullUserName": jsonData["fullUserName"],
    "contactEmail": jsonData["contactEmail"],
    "eventState": jsonData["eventState"],
    "eventCity": jsonData["eventCity"],
    "eventType": jsonData["eventType"],
    "date": jsonData["date"],
    "time": jsonData["time"],
    "eventStatus": jsonData["eventStatus"],
    "eventName": jsonData["eventName"],
    "eventURL": jsonData["eventURL"],
    "registeredAt": DateTime.now()
  });
  final addingToUserArray = await FirebaseFirestore.instance
      .collection("users")
      .doc(userEmail)
      .update({"registeredEvents": userRegisteredForThisEvent});

  final String api_link = impData().singleIdSendEmailAPIURL;
  http
      .post(api_link,
          body: jsonEncode({
            "value1": 3,
            "value2": 4,
            "emailIDS": [
              "mailharshkhatri@gmail.com",
              "Hello@gmail.com",
              "hkhatri557@gmail.com"
            ],
            "sendTo": userEmail,
            "eventData": {
              "fullUserName": jsonData["fullUserName"],
              "contactEmail": jsonData["contactEmail"],
              "eventState": jsonData["eventState"],
              "eventCity": jsonData["eventCity"],
              "eventType": jsonData["eventType"],
              "date": jsonData["date"],
              "time": jsonData["time"],
              "eventName": jsonData["eventName"],
              "eventURL": jsonData["eventURL"],
            }
          }))
      .then((value) {
    var vv = Map.from(json.decode(value.body));
  });
}

statusFalse(email, jsonData, indexOfElement, emailHashCode, userCity, userState,
    userContactNumber) async {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  String userEmail = await storage.read(key: "email");
  List registeredUsers = jsonData["registeredUsers"] ?? [];
  registeredUsers.add({
    "email": userEmail,
    "registeredAt": DateTime.now(),
    "city": userCity,
    "state": userState,
    "userContactNumber": userContactNumber
  });
  final demoThing = await FirebaseFirestore.instance
      .collection("eventList")
      .doc(email)
      .update({
    "${indexOfElement + 1}_${emailHashCode}": {
      "fullUserName": jsonData["fullUserName"],
      "contactEmail": jsonData["contactEmail"],
      "phoneNumber": jsonData["phoneNumber"],
      "eventState": jsonData["eventState"],
      "eventCity": jsonData["eventCity"],
      "eventType": jsonData["eventType"],
      "expectedAudience": jsonData["expectedAudience"],
      "date": jsonData["date"],
      "time": jsonData["time"],
      "eventStatus": jsonData["eventStatus"],
      "eventName": jsonData["eventName"],
      "eventURL": jsonData["eventURL"],
      "registeredUsers": registeredUsers,
    },
  });
  final userData =
      await FirebaseFirestore.instance.collection("users").doc(userEmail).get();
  List userRegisteredForThisEvent = userData.data()['registeredEvents'] ?? [];
  userRegisteredForThisEvent.add({
    "fullUserName": jsonData["fullUserName"],
    "contactEmail": jsonData["contactEmail"],
    "eventState": jsonData["eventState"],
    "eventCity": jsonData["eventCity"],
    "eventType": jsonData["eventType"],
    "date": jsonData["date"],
    "time": jsonData["time"],
    "eventStatus": jsonData["eventStatus"],
    "eventName": jsonData["eventName"],
    "eventURL": jsonData["eventURL"],
    "registeredAt": DateTime.now()
  });
  final addingToUserArray = await FirebaseFirestore.instance
      .collection("users")
      .doc(userEmail)
      .update({"registeredEvents": userRegisteredForThisEvent});

  final String api_link = impData().singleIdSendEmailAPIURL;
  http
      .post(api_link,
          body: jsonEncode({
            "value1": 3,
            "value2": 4,
            "emailIDS": [
              "mailharshkhatri@gmail.com",
              "Hello@gmail.com",
              "hkhatri557@gmail.com"
            ],
            "sendTo": userEmail,
            "eventData": {
              "fullUserName": jsonData["fullUserName"],
              "contactEmail": jsonData["contactEmail"],
              "eventState": jsonData["eventState"],
              "eventCity": jsonData["eventCity"],
              "eventType": jsonData["eventType"],
              "date": jsonData["date"],
              "time": jsonData["time"],
              "eventName": jsonData["eventName"],
              "eventURL": jsonData["eventURL"],
            }
          }))
      .then((value) {
    var vv = Map.from(json.decode(value.body));
  });
}
