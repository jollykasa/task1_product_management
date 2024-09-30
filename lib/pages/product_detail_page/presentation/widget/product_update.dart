import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/common/constant/form_validator.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/product_detail_page/bloc/productdetail_bloc.dart';
import 'package:task1/pages/product_detail_page/presentation/product_detail_page.dart';

class ProductUpdate extends StatefulWidget {
  final String name;
  final String brand;
  final double price;
  final double discount;
  final double rating;
  final String description;
  final String warranty;
  final String returnPolicy;
  final int id;
  const ProductUpdate(
      {super.key,
      required this.id,
      required this.brand,
      required this.name,
      required this.price,
      required this.discount,
      required this.description,
      required this.rating,
      required this.warranty,
      required this.returnPolicy});

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController discount = TextEditingController();
  double ratingcontroller = 0.0;
  final TextEditingController description = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController warrantyController = TextEditingController();
  final TextEditingController returnPolicyController = TextEditingController();
  @override
  void initState() {
    name.text = widget.name;
    price.text = widget.price.toString();
    discount.text = widget.discount.toString();
    description.text = widget.description;
    brandController.text = widget.brand;
    ratingcontroller = widget.rating;
    warrantyController.text = widget.warranty;
    returnPolicyController.text = widget.returnPolicy;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Update Product',
            style: ConstantTextStyle.Font20Bold,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios))),
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
                    "Product Price",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: price,
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Product Price"),
                      decoration: const InputDecoration(
                          hintText: 'Product Price',
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
                          hintText: 'Discound Percentage',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))))),
                  Text(
                    "Rating:",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  RatingBar.builder(
                    initialRating: widget.rating,
                    itemSize: 22,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: false,
                    itemPadding: const EdgeInsets.only(left: 4),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber[300],
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                      ratingcontroller = rating;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Product Description",
                    style: ConstantTextStyle.Font14Bold,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                      controller: description,
                      validator: (value) => FormValidator.validateFieldNotEmpty(
                          value, "Product Description"),
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
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
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<ProductdetailBloc>(context).add(
                                ProductDetailUpdateEvent(
                                    productId: widget.id,
                                    name: name.text,
                                    description: description.text,
                                    discount: double.parse(discount.text),
                                    price: double.parse(price.text),
                                    rating: ratingcontroller));
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
                          "Update Product",
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
