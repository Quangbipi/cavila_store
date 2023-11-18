import 'package:flutter/material.dart';

import '../constans.dart';

class WidgetButton {
  static Widget buildButton(
      double height, double width, Function onClick, String title) {
    return TextButton(
        onPressed: () {
          onClick();
        },
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(width, height)),
            backgroundColor: MaterialStateProperty.all(Constants.pinkColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
