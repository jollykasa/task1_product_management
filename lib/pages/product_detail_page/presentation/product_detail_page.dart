import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/product_detail_page/bloc/productdetail_bloc.dart';
import 'package:task1/pages/product_detail_page/presentation/widget/product_update.dart';
import 'package:task1/pages/product_detail_page/presentation/widget/rating_builder.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  const ProductDetailPage({
    super.key,
    required this.id,
  });
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    BlocProvider.of<ProductdetailBloc>(context)
        .add(ProductdetailInitialEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductdetailBloc, ProductdetailState>(
      listener: (context, state) {
        if (state is ProductdetailDeleteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.successColor,
              content: Text('${state.message}')));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigationPage()));
        }
        if (state is ProductdetailUpdateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.successColor,
              content: Text('${state.message}')));
          BlocProvider.of<ProductdetailBloc>(context)
              .add(ProductdetailInitialEvent(id: widget.id));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        switch (state) {
          case ProductdetailLoading():
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case ProductdetailInitial():
            final model = state.productDetailModel;
            String totalAmount = ((model?.price ?? 0) -
                    ((model?.discountPercentage ?? 0) / 100) *
                        (model?.price ?? 0))
                .toStringAsFixed(2);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  '${model?.category}'.toUpperCase(),
                  style: ConstantTextStyle.Font20Bold,
                ),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationPage()));
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductUpdate(
                                name: model?.title ?? "",
                                description: model?.description ?? "",
                                discount: model?.discountPercentage ?? 0,
                                price: model?.price ?? 0,
                                rating: model?.rating ?? 0,
                                id: model?.id ?? 0,
                                brand: model?.brand ?? "",
                                returnPolicy: model?.returnPolicy ?? "",
                                warranty: model?.warrantyInformation ?? "",
                              ),
                            ));
                      },
                      icon: const Icon(Icons.edit)),
                  TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text(
                          'Confirm',
                          style: ConstantTextStyle.Font20Bold,
                        ),
                        content: Text(
                          'Do you want to delete ${model?.title}?',
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
                              BlocProvider.of<ProductdetailBloc>(context).add(
                                  ProductDeleteEvent(productId: widget.id));
                            },
                            child: Text('OK', style: ConstantTextStyle.Font16),
                          ),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              body: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 4,
                          )
                        ], borderRadius: BorderRadius.circular(20)),
                        child: CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) =>
                              const Center(child: CircularProgressIndicator()),
                          imageUrl: '${model?.thumbnail}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${model?.title}",
                        style: ConstantTextStyle.Font20Bold,
                        maxLines: 2,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Brand: ',
                            style: ConstantTextStyle.Font14Bold),
                        TextSpan(
                          text: '${model?.brand}',
                          style: ConstantTextStyle.Font14only,
                        ),
                      ])),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'Price: ',
                                style: ConstantTextStyle.Font18Bold),
                            TextSpan(
                              text: '${model?.price}',
                              style: ConstantTextStyle.Font16LineThrough,
                            ),
                          ])),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            '\$ $totalAmount',
                            maxLines: 2,
                            style: ConstantTextStyle.FontRed18,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Rating:', style: ConstantTextStyle.Font18Bold),
                          RatingBuilder(
                            rate: model?.rating ?? 0,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${model?.description}",
                        style: ConstantTextStyle.Font18only,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Warranty: ',
                            style: ConstantTextStyle.Font14Bold),
                        TextSpan(
                          text: '${model?.warrantyInformation}',
                          style: ConstantTextStyle.Font14only,
                        ),
                      ])),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Return Policy: ',
                            style: ConstantTextStyle.Font14Bold),
                        TextSpan(
                          text: '${model?.returnPolicy}',
                          style: ConstantTextStyle.Font14only,
                        ),
                      ])),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "REVIEWS",
                          style: ConstantTextStyle.Font18Bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      for (var i in model?.reviews ?? [])
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(1),
                          margin: const EdgeInsets.all(4),
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  "${i.reviewerName}",
                                  style: ConstantTextStyle.Font16Bold,
                                ),
                                RatingBuilder(
                                    itemsize: 14, rate: i.rating.toDouble()),
                              ],
                            ),
                            subtitle: Text(
                              textAlign: TextAlign.start,
                              "${i.comment}",
                              style: ConstantTextStyle.Font16,
                              maxLines: 3,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            );
          case ProductDetailError():
            return const Scaffold(
              body: Center(
                child: Text('Error has occurred'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
