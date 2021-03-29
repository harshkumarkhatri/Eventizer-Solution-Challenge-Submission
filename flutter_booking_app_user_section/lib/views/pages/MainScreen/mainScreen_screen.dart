import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/blocs/mainScreen_bloc.dart';
import 'package:flutter_booking_app_user_section/repositories/logoutUser.dart';
import 'package:flutter_booking_app_user_section/views/pages/EventDetails/eventDetails_screen.dart';
import 'package:flutter_booking_app_user_section/views/pages/MainScreen/Widgets/moreThanOneItemFromAvailableItems_widget.dart';
import 'package:flutter_booking_app_user_section/views/pages/MainScreen/Widgets/registerForEventsTile_widget.dart';
import 'package:flutter_booking_app_user_section/views/pages/MainScreen/Widgets/registeredEventsTile_screen.dart';
import 'package:flutter_booking_app_user_section/views/pages/SettingsScreen/settingScreen_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'Widgets/aboutTheUserTile_widget.dart';
import 'Widgets/activeItemFromAvailableItems_widget.dart';
import 'Widgets/drawerDivider_widget.dart';
import 'Widgets/drawerHeader_widget.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenBloc mainScreen_bloc = MainScreenBloc();
  String email;
  final _firebaseMessagin = FirebaseMessaging();
  String _message = "message";
  String _token = "generating token";

  @override
  void initState() {
    super.initState();
    _firebaseMessagin.configure(
        onMessage: (Map<String, dynamic> message) async {
      setState(() => _message = "$message");
    }, onResume: (Map<String, dynamic> message) async {
      setState(() => _message = "$message");
    }, onLaunch: (Map<String, dynamic> message) async {
      setState(() => _message = "$message");
    });

    _firebaseMessagin.getToken().then((token) {
      setState(() {
        _token = "$token";
      });
    });

    initialzingDemo();
  }

  @override
  void dispose() {
    super.dispose();
    mainScreen_bloc.dispose();
  }

  void initialzingDemo() async {
    CollectionReference users = Firestore.instance.collection("users");

    final FlutterSecureStorage storage = FlutterSecureStorage();
    email = await storage.read(key: "email");
    setState(() {});

    final demoThing =
        await Firestore.instance.collection("users").doc(email).get();
    if (demoThing.data() == null) {
      users.doc(email).set({});
    }
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
          "Eventizer",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Colors.black,
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Settings', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            drawerHeader(email),
            aboutTheUserTile(),
            drawerDivider_widget(),
            registerForEventsTile(),
            drawerDivider_widget(),
            registeredEventsTile(),
            drawerDivider_widget(),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder(
              stream: mainScreen_bloc.mainScreenStream,
              builder: (context, snapshot) {
                mainScreen_bloc.eventSink.add(MainScreenActions.Fetch);
                if (snapshot.hasError) {
                  return Container(
                    child: Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        FieldPath field = FieldPath.fromString(
                            snapshot.data[index].reference.documentID);

                        // This will be returened if an email id has some items.
                        if (snapshot.data[index].data().length > 0) {
                          // This will be returned if there is exact one event
                          if (snapshot.data[index].data().length == 1) {
                            FieldPath field = FieldPath.fromString(
                                snapshot.data[index].reference.documentID);

                            // This will be returned if we have active events
                            var date = DateFormat('yyyy-MM-dd').parse(
                                '${snapshot.data[index].data()['${1}_${field.hashCode}']['date']}');
                            if (snapshot.data[index]
                                            .data()['${1}_${field.hashCode}']
                                        ['eventStatus'] ==
                                    'active' &&
                                DateTime.now().difference(date).inDays <= 0) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(EventDetailsScreen(
                                      snapshot.data[index].reference.documentID,
                                      snapshot.data[index]
                                          .data()['${1}_${field.hashCode}'],
                                      field.hashCode,
                                      1,
                                      true));
                                },
                                child: activeItemFromAvailableItems_widget(
                                    snapshot, index, field),
                              );
                            }

                            // Returned when we have cancelled events
                            else {
                              return Container();
                            }
                          }

                          // Returned when we have more than 1 events
                          else {
                            FieldPath field = FieldPath.fromString(
                                snapshot.data[index].reference.documentID);
                            return Container(
                                child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, indexOF) {
                                var date = DateFormat('yyyy-MM-dd').parse(
                                    '${snapshot.data[index].data()['${indexOF + 1}_${field.hashCode}']['date']}');
                                if (snapshot.data[index].data()[
                                                '${indexOF + 1}_${field.hashCode}']
                                            ['eventStatus'] ==
                                        'active' &&
                                    DateTime.now().difference(date).inDays <=
                                        0) {
                                  return GestureDetector(
                                      onTap: () {
                                        Get.to(EventDetailsScreen(
                                            snapshot.data[index].reference
                                                .documentID,
                                            snapshot.data[index].data()[
                                                '${indexOF + 1}_${field.hashCode}'],
                                            field.hashCode,
                                            indexOF,
                                            false));
                                      },
                                      child:
                                          moreThanOneItemFromAvailableItems_widget(
                                              snapshot, index, indexOF, field));
                                }

                                // returned when we have no events
                                else {
                                  return Container();
                                }
                              },
                              itemCount: snapshot.data[index].data().length,
                            ));
                          }
                        } else {
                          return Container();
                        }
                      },
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        loggingOut();
        break;
      case 'Settings':
        Get.to(SettingScreen());
        break;
    }
  }
}
