import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/common/constant/app_constant.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/signin_page/presentation/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    whereToGo();
    super.initState();
  }

  void whereToGo() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    bool? isLoggedIn = sharedPref.getBool(AppConstant.keyLogin);
    print("*****************WHERE TO GO*******************************");
    print(isLoggedIn);
    print("********************WHERE TO GO****************************");
    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigationPage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInPage()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightTealColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/product.png'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'PRODUCT MANAGEMENT SYSTEM',
              style: ConstantTextStyle.Font16Bold,
            ),
          ],
        ),
      ),
    );
  }
}
