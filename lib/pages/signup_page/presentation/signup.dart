import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/form_validator.dart';
import 'package:task1/pages/signin_page/presentation/signin.dart';
import 'package:task1/pages/signup_page/bloc/signup_page_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool isObscure = true;
  bool isConfirmObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      Image.asset(
                        'assets/images/signup.png',
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.teal),
              ),
              Container(
                height: 500,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                              controller: fname,
                              validator: (value) =>
                                  FormValidator.validateFieldNotEmpty(
                                      value, "Full Name"),
                              decoration: const InputDecoration(
                                  labelText: 'Full Name',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8))))),
                          const SizedBox(
                            height: 10,
                          ),
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
                                    borderSide: BorderSide(color: Colors.teal),
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
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8))))),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: confirmPassword,
                              validator: (value) =>
                                  FormValidator.isMatchPassword(
                                      password.text, value),
                              obscureText: isConfirmObscure,
                              decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isConfirmObscure = !isConfirmObscure;
                                        });
                                      },
                                      icon: isConfirmObscure
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off)),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8))))),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Success");
                                BlocProvider.of<SignupPageBloc>(context).add(
                                    RegisterAddEvent(
                                        email: email.text,
                                        password: password.text,
                                        fullname: fname.text));
                                Navigator.pop(context);
                              }
                            },
                            style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                              AppColors.signButton,
                            )),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInPage()));
                              },
                              child:
                                  const Text("Already have an account? Login"))
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
