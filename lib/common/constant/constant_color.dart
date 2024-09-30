import 'package:flutter/material.dart';

class AppColors {
  static const signButton = Color.fromARGB(255, 5, 99, 89);
  static const lightTealColor = Color.fromARGB(255, 173, 240, 233);
  static const customTealColor = Color.fromARGB(255, 25, 214, 195);
  static const navigationColor = Color.fromARGB(255, 20, 129, 118);
  static const categoryButtonColor = Color.fromARGB(255, 17, 99, 91);
  static const successColor = Color.fromARGB(255, 52, 179, 100);
  static const errorColor = Color.fromARGB(255, 236, 76, 76);

//normal colors
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;

  //gradient colors
  static const backgroundGradient = LinearGradient(
      colors: [Color(0xffdee0d7), Color(0xffe4e9d0)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const ListTileGradient = LinearGradient(colors: [
    Color.fromARGB(255, 133, 191, 220),
    Color.fromARGB(255, 154, 244, 244)
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);
}
