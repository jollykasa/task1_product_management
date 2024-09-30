import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task1/common/constant/constant_color.dart';
import 'package:task1/common/constant/constant_text_style.dart';
import 'package:task1/pages/category_page/bloc/category_bloc.dart';
import 'package:task1/pages/category_page/presentation/widgets/product_list.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Category',
            style: ConstantTextStyle.Font20Bold,
          ),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 7 / 3),
                  itemCount: state.categoriesModel?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("category");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductList(
                                      name:
                                          "${state.categoriesModel?[index].name}",
                                      url:
                                          '${state.categoriesModel?[index].url}',
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: AppColors.categoryButtonColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "${state.categoriesModel?[index].name}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    );
                  },
                );
              case CategoryErrorState():
                return const Text(
                  'Error loading categories',
                );
              default:
                return const SizedBox();
            }
          },
        ));
  }
}
