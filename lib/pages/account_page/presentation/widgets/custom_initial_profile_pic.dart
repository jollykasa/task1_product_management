import 'package:flutter/material.dart';

class CustomInitialProfilePic extends StatelessWidget {
  final String name;
  const CustomInitialProfilePic({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 50,
        width: 50,
        color: Colors.white,
        child: Center(
            child: Text(
          name.trim().isNotEmpty
              ? name.trim().substring(0, 1).toUpperCase()
              : '?',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
