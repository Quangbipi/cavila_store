import 'package:flutter/material.dart';

class IconTextVertical{
  static Widget iconTextVertical(Widget icon, String text, Function action){
    return InkWell(
      onTap: () => action(),
      child: Column(
        children: [
          icon,
          Text(text, style: TextStyle(
            fontSize: 12,
            color: Colors.black
          ),)
        ],
      ),
    );
  } 
}