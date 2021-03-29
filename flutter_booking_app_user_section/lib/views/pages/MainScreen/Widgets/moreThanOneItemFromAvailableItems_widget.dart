import 'package:flutter/material.dart';

Widget moreThanOneItemFromAvailableItems_widget(
    snapshot, index, indexOF, field) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 12.0),
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
              snapshot.data[index].data()['${indexOF + 1}_${field.hashCode}']
                  ["eventName"],
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
                    snapshot.data[index]
                        .data()['${indexOF + 1}_${field.hashCode}']["date"],
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
                    snapshot.data[index]
                        .data()['${indexOF + 1}_${field.hashCode}']["time"],
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
                      snapshot.data[index]
                                  .data()['${indexOF + 1}_${field.hashCode}']
                              ["eventCity"] +
                          ", " +
                          snapshot.data[index]
                                  .data()['${indexOF + 1}_${field.hashCode}']
                              ["eventState"],
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
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                child: Text(
                  "Event Status:-" +
                      snapshot.data[index]
                              .data()['${indexOF + 1}_${field.hashCode}']
                          ["eventStatus"],
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
