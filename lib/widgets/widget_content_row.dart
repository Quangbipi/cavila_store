import 'package:cavila_store/constans.dart';
import 'package:flutter/material.dart';

class ContentRow{
  static Widget contentRowWithIcon(Icon icon, String title, Function action){
    return InkWell(
      onTap: () => action(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon,
                SizedBox(width: 20,),
                Text(title, style: TextStyle(fontSize: 18, color: Colors.black),)
              ],
            ),
            
            Icon(Icons.arrow_forward_ios, color: Constants.pinkColor,)
          ],
        ),
      ),
    );
  }

  static Widget contentRow(String title, Function action, String text, Widget widget){
    return InkWell(
      onTap: () => action(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 18, color: Colors.black),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(text, style: TextStyle(fontSize: 18, color: Colors.black),),
                widget,
              ],
            ),
            
            
          ],
        ),
      ),
    );
  }
}