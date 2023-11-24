import 'package:flutter/material.dart';

import '../utils.dart';

class BackgroundCircle {
  static Widget backgroundCircleTop(BuildContext context) {
    
    double screenWidth = Utils.screenWidth(context);
    return Stack(
      children: [
        Positioned(
          top: -(screenWidth * 0.25),
          child: Container(
            width: screenWidth * 0.5,
            height: screenWidth * 0.5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(106, 224, 217, 0.49),
            ),
          ),
        ),
        Positioned(
          left: -(screenWidth * 0.25),
          child: Container(
            width: screenWidth * 0.5,
            height: screenWidth * 0.5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(106, 224, 217, 0.49),
            ),
          ),
        ),
      ],
    );
  }

  static Widget backgroundCircleBottom(BuildContext context) {
    double screenWidth = Utils.screenWidth(context);
    return Stack(
      children: [
        Positioned(
          bottom: -(screenWidth * 0.25),
          right: 0,
          child: Container(
            width: screenWidth * 0.5,
            height: screenWidth * 0.5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(106, 224, 217, 0.49),
            ),
          ),
        ),
        Positioned(
          right: -(screenWidth * 0.25),
          bottom: 0,
          child: Container(
            width: screenWidth * 0.5,
            height: screenWidth * 0.5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(106, 224, 217, 0.49),
            ),
          ),
        ),
      ],
    );
  }
}
