import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/RegisteredEvents/Widgets/registeredEventsItem_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class RegisteredEvents extends StatefulWidget {
  @override
  _RegisteredEventsState createState() => _RegisteredEventsState();
}

class _RegisteredEventsState extends State<RegisteredEvents> {
  List registeredEventsByUser;
  @override
  void initState() {
    super.initState();
    initialState();
  }

  void initialState() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    String email = await storage.read(key: "email");
    final demoThing = await FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .get()
        .then((value) {
      setState(() {
        registeredEventsByUser = value.data()["registeredEvents"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 0,
        title: Text(
          "Registered Events",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                Get.snackbar("About Registered Events",
                    "Registered events shows all the events which a user has registered for",
                    snackPosition: SnackPosition.BOTTOM,
                    borderColor: Colors.orange,
                    borderWidth: 2,
                    colorText: Colors.orange,
                    backgroundColor: Colors.black,
                    maxWidth: MediaQuery.of(context).size.width);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.info,
                ),
              )),
        ],
      ),
      body: registeredEventsByUser == null
          ? Container(
              color: Colors.orange,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              color: Colors.orange,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: registeredEventsByUser.length,
                itemBuilder: (context, index) {
                  return registeredEventsItem_widget(
                      registeredEventsByUser, index);
                },
              ),
            ),
    );
  }
}
