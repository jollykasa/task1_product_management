import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task1/common/constant/app_constant.dart';
import 'package:task1/common/constant/user_preferences.dart';
import 'package:task1/pages/product_detail_page/model/product_detail_model.dart';

part 'productdetail_event.dart';
part 'productdetail_state.dart';

class ProductdetailBloc extends Bloc<ProductdetailEvent, ProductdetailState> {
  ProductdetailBloc() : super(ProductdetailInitial()) {
    _onInit();
    _onProductDelete();
    _onProductUpdate();
  }
  _onInit() {
    on<ProductdetailInitialEvent>((event, emit) async {
      emit(ProductdetailLoading());
      try {
        Dio dio = Dio();
        Response response =
            await dio.get("${AppConstant.baseUrl}/products/${event.id}");
        if (response.data != null) {
          log(response.data.toString());
          emit(ProductdetailInitial(
              productDetailModel: ProductDetailModel.fromJson(response.data)));
        }
      } on DioException catch (e) {
        emit(ProductDetailError(message: e.toString()));
        print(e.toString());
      }
    });
  }

  _onProductDelete() {
    on<ProductDeleteEvent>((event, emit) async {
      emit(ProductdetailLoading());
      try {
        Dio _dio = Dio();
        Response response = await _dio
            .delete('${AppConstant.baseUrl}/products/${event.productId}');
        if (response.data != null) {
          log(response.data.toString());
          UserPreferences.setProductId(event.productId.toString());
          emit(ProductdetailDeleteSuccess(
              message: "Product deleted successfully"));
        }
      } on DioException catch (e) {
        emit(ProductDetailError(message: e.toString()));
        print(e.toString());
      }
    });
  }

  _onProductUpdate() {
    on<ProductDetailUpdateEvent>((event, emit) async {
      emit(ProductdetailLoading());
      try {
        Dio _dio = Dio();
        Response response = await _dio
            .put('${AppConstant.baseUrl}/products/${event.productId}', data: {
          'title': event.name,
          'discountPercentage': event.discount,
          'description': event.description,
          'price': event.price,
          'brand': event.brand,
          "warrantyInformation": event.warranty,
          "returnPolicy": event.returnPolicy,
          'rating': event.rating,
        });
        if (response.data != null) {
          log(response.data.toString());
          emit(ProductdetailUpdateSuccess(
              message: "Product Updated successfully"));
          emit(ProductdetailInitial().copyWith(
              productDetailModel: ProductDetailModel.fromJson(response.data)));
        }
      } on DioException catch (e) {
        emit(ProductDetailError(message: e.toString()));
      }
    });
  }
}
