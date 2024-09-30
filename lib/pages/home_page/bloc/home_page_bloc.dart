import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task1/common/constant/app_constant.dart';
import 'package:task1/common/constant/user_preferences.dart';

import '../model/product_model.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitialState()) {
    _oninit();
    _addProduct();
    _onsearchProduct();
  }

  _oninit() {
    on<HomePageInitialEvent>((event, emit) async {
      emit(HomePageLoadingState());
      String? deleteProductId = UserPreferences.getProductId();
      print(
          "********************Product Id Delete product***********************");
      print(UserPreferences.getProductId());
      print(
          "********************Product Id Delete product***********************");
      try {
        Dio _dio = Dio();
        Response response =
            await _dio.get("${AppConstant.baseUrl}/products?limit=80");
        Response categoryResponse =
            await _dio.get("${AppConstant.baseUrl}/products/category-list");
        print(categoryResponse.data);
        if (response.data != null && categoryResponse.data != null) {
          log(categoryResponse.data.toString());
          log(response.data.toString());
          emit(HomePageInitialState(
              productModel: ProductModel.fromJson(response.data),
              categoryList: categoryResponse.data));
        }
      } on DioException catch (e) {
        emit(HomePageErrorState(message: e.response?.statusMessage.toString()));
        print(e.toString());
      }
    });
  }

  _addProduct() {
    on<AddProductHomePageEvent>((event, emit) async {
      emit(HomePageLoadingState());
      try {
        print(
            'title: ${event.name},category: ${event.category}, description: ${event.description},price: ${event.price},discountPercentage: ${event.discount},brand: ${event.brand},warrantyInformation: ${event.warranty},returnPolicy:${event.returnPolicy}, thumbnail: ${event.imagePath}');
        Dio _dio = Dio();
        Response response =
            await _dio.post('${AppConstant.baseUrl}/products/add', data: {
          'title': event.name,
          'category': event.category,
          'description': event.description,
          'price': event.price,
          'discountPercentage': event.discount,
          'brand': event.brand,
          'warrantyInformation': event.warranty,
          'returnPolicy': event.returnPolicy,
          'thumbnail': event.imagePath,
        });
        if (response.data != null) {
          log(response.data.toString());
          emit(HomeSucessState(successMessage: "Added Product Successfully"));
          //list
        } else {
          emit(HomePageErrorState(message: "Product Not Added Successfully"));
        }
      } on DioException catch (e) {
        emit(HomePageErrorState(message: e.response?.statusMessage.toString()));
        print(e.toString());
      }
    });
  }

  _onsearchProduct() {
    on<SearchProductHomePageEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        emit(HomePageLoadingState());
        try {
          Dio _dio = Dio();
          Response response = await _dio
              .get('${AppConstant.baseUrl}/products/search?q=${event.search}');
          if (response.data != null) {
            log(response.data.toString());
            emit(HomePageSearchState(
                productModel: ProductModel.fromJson(response.data)));
          }
        } on DioException catch (e) {
          emit(HomePageErrorState(
              message: e.response?.statusMessage.toString()));
        }
      }
    });
  }
}
