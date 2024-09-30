import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task1/common/constant/app_constant.dart';
import 'package:task1/pages/category_page/model/categories_model.dart';
import 'package:task1/pages/home_page/model/product_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    _oninit();
    _categoryList();
  }
  _oninit() {
    on<CategoryInitialEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        Dio _dio = Dio();
        Response response =
            await _dio.get("${AppConstant.baseUrl}/products/categories");
        if (response.data != null) {
          log(response.data.toString());
          emit(CategoryInitial(
              categoriesModel: CategoriesModel.fromJsonList(response.data)));
        }
      } on DioException catch (e) {
        emit(CategoryErrorState(message: e.toString()));
      }
    });
  }

  _categoryList() {
    on<CategoryListEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        Dio _dio = Dio();
        Response response = await _dio.get(event.url);
        if (response.data != null) {
          log(response.data.toString());
          emit(CategoryInitial(
              productModel: ProductModel.fromJson(response.data)));
        }
      } on DioException catch (e) {
        emit(CategoryErrorState(message: e.toString()));
      }
    });
  }
}
