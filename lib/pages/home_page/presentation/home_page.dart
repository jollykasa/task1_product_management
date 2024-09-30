import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/pages/home_page/bloc/home_page_bloc.dart';
import 'package:task1/pages/home_page/presentation/widgets/add_product.dart';
import 'package:task1/pages/home_page/presentation/widgets/carousel_view.dart';
import 'package:task1/pages/home_page/presentation/widgets/product_title_widget.dart';
import 'package:task1/pages/home_page/presentation/widgets/search_text_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomePageBloc>(context).add(HomePageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Product Management',
          style: ConstantTextStyle.Font20Bold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchTextForm()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state is HomeSucessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppColors.successColor,
                content: Text('${state.successMessage}')));
          }
          if (state is HomePageErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppColors.errorColor,
                content: Text('${state.message}')));
          }
        },
        builder: (context, state) {
          switch (state) {
            case HomePageLoadingState():
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case HomePageInitialState():
              return Column(
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(opacity: value, child: child);
                    },
                    child: const Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 150,
                    child: const CustomCarouselView(),
                  ),
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(opacity: value, child: child);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AddProduct(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      // physics: const NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount: state.productModel?.products?.length,
                      itemBuilder: (context, index) {
                        return ProductTitleWidget(
                          id: state.productModel?.products?[index].id ?? 0,
                          image:
                              state.productModel?.products?[index].thumbnail ??
                                  "",
                          name: '${state.productModel?.products?[index].title}',
                          price:
                              state.productModel?.products?[index].price ?? 0,
                          discound: state.productModel?.products?[index]
                                  .discountPercentage ??
                              0,
                        );
                      },
                    ),
                  ),
                ],
              );
            case HomePageErrorState():
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
