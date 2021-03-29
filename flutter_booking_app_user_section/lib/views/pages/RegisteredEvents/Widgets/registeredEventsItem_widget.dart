import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/views/pages/RegisteredEvents/RegistedEventItemDetails/registeredEventItemDetails_screen.dart';
import 'package:get/get.dart';

Widget registeredEventsItem_widget(List registeredEventsByUser, int index) {
  return GestureDetector(
    onTap: () {
      Get.to(RegisteredEventItemDetails(registeredEventsByUser[index]));
    },
    child: Padding(
      padding:
          const EdgeInsets.only(left: 15, right: 15, top: 6.0, bottom: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text(
                registeredEventsByUser[index]["eventName"],
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                ),
              ),

              // Date And Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.calendar_today, color: Colors.orange),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      registeredEventsByUser[index]["date"],
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      registeredEventsByUser[index]["time"],
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.lock_clock,
                    color: Colors.orange,
                  ),
                ],
              ),

              // Location
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.orange),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        registeredEventsByUser[index]["eventCity"] +
                            ", " +
                            registeredEventsByUser[index]["eventState"],
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
