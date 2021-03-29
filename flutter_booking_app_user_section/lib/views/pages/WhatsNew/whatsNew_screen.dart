import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/api/WhatsNew/whatsNew_api.dart';
import 'package:http/http.dart' as http;

import 'Widgets/whatsNewItem_widget.dart';

class WhatsNewScreen extends StatefulWidget {
  @override
  _WhatsNewScreenState createState() => _WhatsNewScreenState();
}

class _WhatsNewScreenState extends State<WhatsNewScreen> {
  Future<http.Response> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(
          0.9,
        ),
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        centerTitle: true,
        title: Text(
          "What's New",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: FutureBuilder<http.Response>(
        future: futureAlbum,
        builder: (context, snapshot) {
          var json;
          if (snapshot.data != null) {
            json = jsonDecode(snapshot.data.body);
          }

          if (snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  itemCount: json.keys.length,
                  itemBuilder: (BuildContext context, int index) {
                    return whatsNewItem_widget(json, index);
                  }),
            );
          } else if (snapshot.hasError) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.orange,
                child: Center(child: CircularProgressIndicator()));
          }

          // By default, show a loading spinner.
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
