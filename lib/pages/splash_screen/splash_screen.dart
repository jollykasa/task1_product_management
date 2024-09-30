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
    whereToGo(context);
    super.initState();
  }

  void whereToGo(context) async {
    var sharePref = await SharedPreferences.getInstance();
    String email = sharePref.getString(AppConstant.keyLogin) ?? "";
    setState(() {});
    Timer(const Duration(seconds: 2), () {
      if (email.isEmpty && email == "") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationPage()));
      }
      // if (isLoggedIn != null) {
      //   if (isLoggedIn) {
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => const BottomNavigationPage()));
      //   } else {

      //   }
      // } else {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => const SignInPage()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customTealColor,
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
