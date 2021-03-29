import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/EventDetails/Widgets/registerButton_widget.dart';
import 'Widgets/dividerEventDetailsScreen_widget.dart';
import 'Widgets/itemTextEventDetailsScreen_widget.dart';

class EventDetailsScreen extends StatefulWidget {
  EventDetailsScreen(this.email, this.jsonData, this.emailHashCode,
      this.indexOfElement, this.status);
  String email;
  dynamic jsonData;
  var emailHashCode;
  var indexOfElement;
  bool status;

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
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
          widget.jsonData["eventName"],
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 15,
                right: 15,
              ),
              child: ListView(
                children: [
                  itemTextEventDetails_widget(
                    "Event By",
                    widget.jsonData['fullUserName'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Contact Email",
                    widget.jsonData['contactEmail'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Location",
                    widget.jsonData['eventState'] +
                        ", " +
                        widget.jsonData['eventCity'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Event Type",
                    widget.jsonData['eventType'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Timing",
                    widget.jsonData['time'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Date (yyyy-mm-dd)",
                    widget.jsonData['date'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Event URL",
                    widget.jsonData['eventURL'],
                  ),
                  dividerEventDetail(),
                  SizedBox(
                    height: 55,
                  )
                ],
              ),
            ),
            registerButton_widget(
                widget.email,
                widget.jsonData,
                widget.emailHashCode,
                widget.indexOfElement,
                widget.status,
                context),
          ],
        ),
      ),
    );
  }
}
