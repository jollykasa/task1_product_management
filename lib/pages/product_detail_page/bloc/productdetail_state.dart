part of 'productdetail_bloc.dart';

sealed class ProductdetailState extends Equatable {}

final class ProductdetailInitial extends ProductdetailState {
  final ProductDetailModel? productDetailModel;

  ProductdetailInitial({this.productDetailModel});

  @override
  List<Object?> get props => [productDetailModel];

  ProductdetailInitial copyWith({ProductDetailModel? productDetailModel}) =>
      ProductdetailInitial(
          productDetailModel: productDetailModel ?? this.productDetailModel);
}

class ProductdetailLoading extends ProductdetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailError extends ProductdetailState {
  String? message;
  ProductDetailError({required this.message});
  @override
  List<Object?> get props => [message];
}

class ProductdetailDeleteSuccess extends ProductdetailState {
  String? message;
  ProductdetailDeleteSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}
