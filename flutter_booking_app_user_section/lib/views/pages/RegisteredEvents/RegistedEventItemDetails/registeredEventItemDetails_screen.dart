import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/EventDetails/Widgets/dividerEventDetailsScreen_widget.dart';
import 'package:flutter_booking_app_user_section/views/pages/EventDetails/Widgets/itemTextEventDetailsScreen_widget.dart';

class RegisteredEventItemDetails extends StatelessWidget {
  RegisteredEventItemDetails(this.registeredEventsByUser);

  dynamic registeredEventsByUser;

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
          registeredEventsByUser['eventName'],
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
                    registeredEventsByUser['fullUserName'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Contact Email",
                    registeredEventsByUser['contactEmail'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Location",
                    registeredEventsByUser['eventState'] +
                        ", " +
                        registeredEventsByUser['eventCity'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Event Type",
                    registeredEventsByUser['eventType'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Timing",
                    registeredEventsByUser['time'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Date (yyyy-mm-dd)",
                    registeredEventsByUser['date'],
                  ),
                  dividerEventDetail(),
                  itemTextEventDetails_widget(
                    "Event URL",
                    registeredEventsByUser['eventURL'],
                  ),
                  dividerEventDetail(),
                  SizedBox(
                    height: 55,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
