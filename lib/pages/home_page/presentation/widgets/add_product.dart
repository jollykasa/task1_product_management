import 'package:flutter/material.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/pages/home_page/presentation/widgets/add_product_form.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddProductForm()));
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20),
        padding: const EdgeInsets.all(10),
        height: 42,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.blackColor),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Product',
              style: ConstantTextStyle.Font14Bold,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.add_box,
              color: AppColors.blackColor,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
