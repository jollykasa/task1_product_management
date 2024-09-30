import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/form_validator.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/signin_page/bloc/sign_in_page_bloc.dart';
import 'package:task1/pages/signup_page/presentation/signup.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<SignInPageBloc, SignInPageState>(
        listener: (cxt, state) {
          if (state is SignInSuccessState) {
            print("sucessfully built");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppColors.successColor,
                content: Text(state.message)));
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const BottomNavigationPage()));
          } else if (state is SignInErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppColors.errorColor,
                content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: AppColors.customTealColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Image.asset(
                      'assets/images/login.png',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.teal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.9,
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blackColor),
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) =>
                                    FormValidator.validateEmail(value),
                                decoration: const InputDecoration(
                                    labelText: 'Email',
                                    suffixIcon: Icon(Icons.person),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide:
                                          BorderSide(color: Colors.teal),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))))),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                controller: password,
                                validator: (value) =>
                                    FormValidator.validatePassword(
                                        value, 'Password'),
                                obscureText: isObscure,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                        icon: isObscure
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide:
                                          BorderSide(color: Colors.teal),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))))),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  print("successfully login");
                                  BlocProvider.of<SignInPageBloc>(context).add(
                                      SignInPageNavigation(
                                          email: email.text,
                                          password: password.text));
                                }
                              },
                              style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                AppColors.signButton,
                              )),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                child: const Text(
                                    "Don't have an account signUp? SignUp"))
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
