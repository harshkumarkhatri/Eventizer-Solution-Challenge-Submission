import 'package:flutter/material.dart';
import 'package:flutter_booking_app_user_section/utils/constants.dart';
import 'package:share/share.dart';

Widget shareTheApp_widget(IconData icon, String text) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Share.share(
        Constants.shareText,
        subject: "Eventizer",
      );
    },
    child: Container(
      alignment: Alignment.centerLeft,
      height: 45,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(icon),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    ),
  );
}
