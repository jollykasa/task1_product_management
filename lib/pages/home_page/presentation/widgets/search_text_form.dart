import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/pages/bottom_navigation/bottom_navigation.dart';
import 'package:task1/pages/home_page/bloc/home_page_bloc.dart';
import 'package:task1/pages/product_detail_page/presentation/product_detail_page.dart';

class SearchTextForm extends StatefulWidget {
  const SearchTextForm({super.key});

  @override
  State<SearchTextForm> createState() => _SearchTextFormState();
}

class _SearchTextFormState extends State<SearchTextForm> {
  final TextEditingController searchField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigationPage()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Form(
            child: TextFormField(
          controller: searchField,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search',
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            suffixIcon: IconButton(
                onPressed: () {
                  BlocProvider.of<HomePageBloc>(context).add(
                      SearchProductHomePageEvent(search: searchField.text));
                },
                icon: const Icon(Icons.search)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        )),
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          switch (state) {
            case HomePageLoadingState():
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case HomePageSearchState():
              return ListView.builder(
                  itemCount: state.productModel?.products?.length,
                  itemBuilder: (context, index) {
                    return searchField.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              print("click");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailPage(
                                            id: state.productModel
                                                    ?.products?[index].id ??
                                                0,
                                            price: state.productModel
                                                ?.products?[index].price,
                                            discount: state
                                                .productModel
                                                ?.products?[index]
                                                .discountPercentage,
                                          )));
                            },
                            child: ListTile(
                              leading: CachedNetworkImage(
                                progressIndicatorBuilder:
                                    (context, url, progress) => const Center(
                                        child: CircularProgressIndicator()),
                                imageUrl:
                                    "${state.productModel?.products?[index].thumbnail}",
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                "${state.productModel?.products?[index].title}",
                                style: ConstantTextStyle.Font14Bold,
                              ),
                              subtitle: Text(
                                  "\$ ${state.productModel?.products?[index].price}"),
                            ),
                          )
                        : const SizedBox();
                  });
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
