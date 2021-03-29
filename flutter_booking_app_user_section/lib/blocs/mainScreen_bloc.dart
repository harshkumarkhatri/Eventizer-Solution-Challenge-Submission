import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

enum MainScreenActions { Fetch }

class MainScreenBloc {
  final streamController = StreamController();
  StreamSink get mainScreenSink => streamController.sink;
  Stream get mainScreenStream => streamController.stream;

  final eventController = StreamController();
  StreamSink get eventSink => eventController.sink;
  Stream get eventStream => eventController.stream;

  MainScreenBloc() {
    eventStream.listen((event) async {
      if (event == MainScreenActions.Fetch) {
        try {
          final demoThing = await Firestore.instance
              .collection("eventList")
              .get()
              .then((value) {
            if (value.docs == null) {
              mainScreenSink.addError("Docs were found to be empty");
            } else {
              mainScreenSink.add(value.docs);
            }
          });
        } catch (e) {}
      }
    });
  }

  void dispose() {
    streamController.close();
    eventController.close();
  }
}
