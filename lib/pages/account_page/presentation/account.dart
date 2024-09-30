import 'package:flutter/material.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/common/constant/user_preferences.dart';
import 'package:task1/pages/account_page/presentation/widgets/custom_initial_profile_pic.dart';
import 'package:task1/pages/account_page/presentation/widgets/custom_list_title.dart';
import 'package:task1/pages/signin_page/presentation/signin.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? email;
  @override
  void initState() {
    _retrieveUserEmail();
    super.initState();
  }

  _retrieveUserEmail() async {
    email = UserPreferences.getUserEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Uri phoneNum = Uri.parse('tel:+9779854211790');
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Account',
            style: ConstantTextStyle.Font20Bold,
          ),
        ),
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                height: 100,
                width: MediaQuery.of(context).size.width / 1.18,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.35), spreadRadius: 4)
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomInitialProfilePic(
                      name: email ?? "User",
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(seconds: 1),
                      builder: (context, value, child) {
                        return Opacity(opacity: value, child: child);
                      },
                      child: Text(email ?? "User@gmail.com",
                          style: ConstantTextStyle.Font18Bold),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            CustomListTitle(
              title: 'Call',
              icon: const Icon(
                Icons.call,
                size: 20,
                color: AppColors.blackColor,
              ),
              callback: () {
                launchUrl(phoneNum);
              },
            ),
            CustomListTitle(
              title: 'Log Out',
              icon: const Icon(
                Icons.logout,
                size: 20,
                color: AppColors.blackColor,
              ),
              callback: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    'Confirm',
                    style: ConstantTextStyle.Font20Bold,
                  ),
                  content: Text(
                    'Do you want Log Out?',
                    style: ConstantTextStyle.Font18,
                    maxLines: 3,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Text(
                        'Cancel',
                        style: ConstantTextStyle.Font16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _userLogOut();
                      },
                      child: Text('OK', style: ConstantTextStyle.Font16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  _userLogOut() {
    UserPreferences.isSetUserLoggedIn(false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInPage()));
  }
}
