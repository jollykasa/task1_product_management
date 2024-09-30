part of 'productdetail_bloc.dart';

sealed class ProductdetailEvent extends Equatable {
  const ProductdetailEvent();

  @override
  List<Object> get props => [];
}

class ProductdetailInitialEvent extends ProductdetailEvent {
  final int id;
  const ProductdetailInitialEvent({required this.id});
}

class ProductDeleteEvent extends ProductdetailEvent {
  final int productId;
  const ProductDeleteEvent({required this.productId});
}

class ProductDetailUpdateEvent extends ProductdetailEvent {
  final int productId;
  final String name;
  final double price;
  final double discount;
  final double rating;
  final String description;
  final String brand;
  final String warranty;
  final String returnPolicy;
  const ProductDetailUpdateEvent({
    required this.productId,
    required this.name,
    required this.price,
    required this.discount,
    required this.description,
    required this.rating,
    required this.brand,
    required this.warranty,
    required this.returnPolicy,
  });
}
