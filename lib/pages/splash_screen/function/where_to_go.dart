import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/common/constant/app_constant.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/signin_page/presentation/signin.dart';

// void whereToGo(context) async {
//   var sharePref = await SharedPreferences.getInstance();
//   var isLoggedIn = sharePref.getBool(AppConstant.keyLogin);
//   Timer(const Duration(seconds: 2), () {
//     // if (isLoggedIn != null) {
//     //   if (isLoggedIn) {
//     // Navigator.pushReplacement(context,
//     //     MaterialPageRoute(builder: (context) => const BottomNavigationPage()));
//     //   } else {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => const SignInPage()));
//     //   }
//     // } else {
//     //   Navigator.pushReplacement(
//     //       context, MaterialPageRoute(builder: (context) => const SignInPage()));
//     // }
//   });
// }
