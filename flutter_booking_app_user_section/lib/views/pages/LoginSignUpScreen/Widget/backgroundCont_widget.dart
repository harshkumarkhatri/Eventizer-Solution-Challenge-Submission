import 'package:flutter/material.dart';

Widget backgroundContainers(context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          color: Colors.orange,
          height: 225,
          child: Container(
            height: 65,
            width: 65,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
