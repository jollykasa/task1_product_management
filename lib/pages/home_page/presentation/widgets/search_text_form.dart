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
          onTapOutside: (value) {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
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
              return state.productModel?.products != null &&
                      state.productModel!.products!.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: state.productModel?.products?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailPage(
                                                id: state.productModel
                                                        ?.products?[index].id ??
                                                    0,
                                              )));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    leading: SizedBox(
                                      width: 60,
                                      child: CachedNetworkImage(
                                        progressIndicatorBuilder: (context, url,
                                                progress) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        imageUrl:
                                            "${state.productModel?.products?[index].thumbnail}",
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      "${state.productModel?.products?[index].title}",
                                      style: ConstantTextStyle.Font14Bold,
                                    ),
                                    subtitle: Text(
                                        "\$ ${state.productModel?.products?[index].price}"),
                                  ),
                                ));
                          }),
                    )
                  : SizedBox(
                      child: Center(
                        child: Text(
                          "Product not found",
                          style: ConstantTextStyle.Font14Bold,
                        ),
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
