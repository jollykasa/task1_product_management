import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/pages/product_detail_page/presentation/product_detail_page.dart';

class ProductTitleWidget extends StatefulWidget {
  final int id;
  final String image;
  final String name;
  final double price;
  final double discound;
  const ProductTitleWidget(
      {super.key,
      required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.discound});

  @override
  State<ProductTitleWidget> createState() => _ProductTitleWidgetState();
}

class _ProductTitleWidgetState extends State<ProductTitleWidget> {
  double totalAmount = 0;
  discountCalculation(price, discount) {
    double discountAmount = price * (discount / 100);
    totalAmount = price - discountAmount;
  }

  @override
  void initState() {
    discountCalculation(widget.price, widget.discound);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                      id: widget.id,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(3),
        child: Card(
          elevation: 0.5,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: widget.image,
                height: 150,
                fit: BoxFit.cover,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  widget.name,
                  maxLines: 2,
                  style: ConstantTextStyle.Font14Bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.price}',
                    style: ConstantTextStyle.Font14LineThrough,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "\$${totalAmount.toStringAsFixed(2)}",
                    maxLines: 2,
                    style: ConstantTextStyle.FontRed14,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
