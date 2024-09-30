import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/category_page/bloc/category_bloc.dart';
import 'package:task1/pages/product_detail_page/presentation/product_detail_page.dart';

class ProductList extends StatefulWidget {
  final String url;
  final String name;
  const ProductList({super.key, required this.url, required this.name});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context)
        .add(CategoryListEvent(url: widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: ConstantTextStyle.Font20Bold,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigationPage()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          switch (state) {
            case CategoryLoadingState():
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case CategoryInitial():
              return GridView.builder(
                  itemCount: state.productModel?.products?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                      id: state.productModel?.products?[index]
                                              .id ??
                                          0,
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                progressIndicatorBuilder:
                                    (context, url, progress) => const Center(
                                        child: CircularProgressIndicator()),
                                imageUrl: state.productModel?.products?[index]
                                        .thumbnail ??
                                    "",
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                '${state.productModel?.products?[index].title}',
                                maxLines: 2,
                                style: ConstantTextStyle.Font16Bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            case CategoryErrorState():
              return const Scaffold(
                body: Center(
                  child: Text('Error has occurred'),
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
