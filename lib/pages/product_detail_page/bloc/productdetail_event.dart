part of 'productdetail_bloc.dart';

sealed class ProductdetailEvent extends Equatable {
  const ProductdetailEvent();

  @override
  List<Object> get props => [];
}

class ProductdetailInitialEvent extends ProductdetailEvent {
  int id;
  ProductdetailInitialEvent({required this.id});
}

class ProductDeleteEvent extends ProductdetailEvent {
  int productId;
  ProductDeleteEvent({required this.productId});
}

class ProductDetailUpdateEvent extends ProductdetailEvent {
  final int productId;
  final String name;
  final double price;
  final double discount;
  final double rating;
  final String description;
  const ProductDetailUpdateEvent(
      {required this.productId,
      required this.name,
      required this.price,
      required this.discount,
      required this.description,
      required this.rating});
}
