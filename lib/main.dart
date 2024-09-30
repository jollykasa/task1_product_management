import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/app_constant.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/user_preferences.dart';
import 'package:task1/common/helper/bloc_helper.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/category_page/presentation/category_page.dart';
import 'package:task1/pages/home_page/bloc/home_page_bloc.dart';
import 'package:task1/pages/category_page/model/categories_model.dart';
import 'package:task1/pages/home_page/presentation/home_page.dart';
import 'package:task1/pages/signin_page/presentation/signin.dart';
import 'package:task1/pages/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
  UserPreferences.init();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviderHelper.providers,
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.whiteColor, centerTitle: true)),
        debugShowCheckedModeBanner: false,
        title: "Product App",
        home: const SignInPage(),
      ),
    );
  }
}
