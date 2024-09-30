import 'package:flutter/material.dart';
import 'package:task1/common/constant/constant_text_style.dart';

class CustomListTitle extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback? callback;
  const CustomListTitle(
      {super.key, required this.title, required this.icon, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback!.call();
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(
            textAlign: TextAlign.start,
            title,
            style: ConstantTextStyle.Font18Bold,
          ),
          leading: icon,
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}
