import 'package:flutter/material.dart';

class logoApp {
  Widget logo() {
    return Container(
      width: 150,
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 49, 175, 180),
            Color.fromARGB(255, 67, 241, 247)
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Text(
        "P",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textScaleFactor: 8,
        textAlign: TextAlign.center,
      ),
    );
  }
}
