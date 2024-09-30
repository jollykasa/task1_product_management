// import 'package:flutter/material.dart';

// class CustomTextFormField extends StatefulWidget {
//   const CustomTextFormField({super.key});

//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//             controller: fname,
//             validator: (value) =>
//                 FormValidator.validateFieldNotEmpty(value, "First Name"),
//             decoration: const InputDecoration(
//                 labelText: 'First Name',
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   borderSide: BorderSide(color: Colors.teal),
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8))))),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//             controller: lname,
//             validator: (value) =>
//                 FormValidator.validateFieldNotEmpty(value, "Last Name"),
//             decoration: const InputDecoration(
//                 labelText: 'Last Name',
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   borderSide: BorderSide(color: Colors.teal),
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8))))),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//             controller: email,
//             validator: (value) => FormValidator.validateEmail(value),
//             decoration: const InputDecoration(
//                 labelText: 'Email',
//                 suffixIcon: Icon(Icons.person),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   borderSide: BorderSide(color: Colors.teal),
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8))))),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//             controller: password,
//             validator: (value) =>
//                 FormValidator.validatePassword(value, 'Password'),
//             obscureText: isObscure,
//             decoration: InputDecoration(
//                 labelText: 'Password',
//                 suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         isObscure = !isObscure;
//                       });
//                     },
//                     icon: isObscure
//                         ? const Icon(Icons.visibility)
//                         : const Icon(Icons.visibility_off)),
//                 focusedBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   borderSide: BorderSide(color: Colors.teal),
//                 ),
//                 border: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8))))),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//             controller: confirmPassword,
//             validator: (value) =>
//                 FormValidator.isMatchPassword(password.text, value),
//             obscureText: isConfirmObscure,
//             decoration: InputDecoration(
//                 labelText: 'Confirm Password',
//                 suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         isConfirmObscure = !isConfirmObscure;
//                       });
//                     },
//                     icon: isConfirmObscure
//                         ? const Icon(Icons.visibility)
//                         : const Icon(Icons.visibility_off)),
//                 focusedBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   borderSide: BorderSide(color: Colors.teal),
//                 ),
//                 border: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8))))),
//         const SizedBox(
//           height: 10,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               print("Success");
//             }
//           },
//           style: const ButtonStyle(
//               backgroundColor: WidgetStatePropertyAll(
//             AppColors.signButton,
//           )),
//           child: const Text(
//             "Sign Up",
//             style: TextStyle(color: AppColors.whiteColor),
//           ),
//         ),
//         TextButton(
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => const SignInPage()));
//             },
//             child: const Text("Already have an account? Login"))
//       ],
//     );
//   }
// }
