import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/common/constant/form_validator.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/home_page/bloc/home_page_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  String? category;

  String? imageName;
  File? imageFile;
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController discount = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController warrantyController = TextEditingController();
  final TextEditingController returnPolicyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
          style: ConstantTextStyle.Font20Bold,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: name,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Product Name"),
                      decoration: const InputDecoration(
                          hintText: 'Product Name',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))))),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Product Category",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (context, state) {
                      switch (state) {
                        case HomePageInitialState():
                          return DropdownButtonFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.whiteColor,
                              contentPadding: const EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            hint: const Text('Product Category'),
                            onChanged: (v) {
                              print(v);
                              category = v.toString();
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Product Category cannot be empty.";
                              }
                              return null;
                            },
                            items: state.categoryList!.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e.toString()),
                              );
                            }).toList(),
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Product Price",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: price,
                      maxLength: 9,
                      keyboardType: TextInputType.number,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Product Price"),
                      decoration: const InputDecoration(
                          hintText: '\$ Product Price',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))))),
                  Text(
                    "Discound Percentage",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: discount,
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Discound Percentage"),
                      decoration: const InputDecoration(
                          hintText: 'Discound Percentage %',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))))),
                  Text(
                    "Product Brand",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: brandController,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Product Brand"),
                      decoration: const InputDecoration(
                          hintText: 'Product Brand',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))))),
                  const SizedBox(height: 20),
                  Text(
                    "Product Warranty Information",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: warrantyController,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Product Warranty Information"),
                      decoration: const InputDecoration(
                          hintText: 'Product Warranty Information',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))))),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Product Return Policy",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: returnPolicyController,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Product Return Policy"),
                      decoration: const InputDecoration(
                          hintText: 'Product Return Policy',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))))),
                  const SizedBox(height: 20),
                  Text(
                    "Product Description",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: description,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Product Description"),
                      decoration: const InputDecoration(
                          hintText: 'Product Description',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))))),
                  const SizedBox(height: 20),
                  imageFile == null
                      ? const SizedBox()
                      : Center(
                          child: SizedBox(
                              height: 200, child: Image.file(imageFile!))),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          imageFile = File(image.path);
                          setState(() {
                            imageName = imageFile!.path.split('/').last;
                          });
                        }
                      },
                      child: imageName == null
                          ? Text(
                              "Choose Product Image",
                              style: ConstantTextStyle.Font14Black,
                            )
                          : Text(
                              "$imageName",
                              style: ConstantTextStyle.Font14Black,
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (imageName == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('No image selected')));
                          }
                          if (_formKey.currentState!.validate() &&
                              imageName != null) {
                            BlocProvider.of<HomePageBloc>(context)
                                .add(AddProductHomePageEvent(
                              description: description.text,
                              name: name.text,
                              price: double.parse(price.text),
                              category: category.toString(),
                              brand: brandController.text,
                              discount: double.parse(discount.text),
                              imagePath: imageName.toString(),
                              returnPolicy: returnPolicyController.text,
                              warranty: warrantyController.text,
                            ));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationPage()));
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                AppColors.customTealColor)),
                        child: Text(
                          "Add Product",
                          style: ConstantTextStyle.Font14Boldwhite,
                        )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
