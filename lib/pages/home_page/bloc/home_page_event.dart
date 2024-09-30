part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {}

class HomePageInitialEvent extends HomePageEvent {
  @override
  List<Object> get props => [];
}

class AddProductHomePageEvent extends HomePageEvent {
  final String name;
  final double price;
  final double discount;
  final String category;
  final String description;
  final String brand;
  final String warranty;
  final String returnPolicy;
  final String imagePath;
  AddProductHomePageEvent(
      {required this.name,
      required this.price,
      required this.discount,
      required this.category,
      required this.description,
      required this.brand,
      required this.warranty,
      required this.returnPolicy,
      required this.imagePath});
  @override
  List<Object> get props => [
        name,
        price,
        category,
        description,
      ];
}

class SearchProductHomePageEvent extends HomePageEvent {
  String search;
  SearchProductHomePageEvent({required this.search});
  @override
  List<Object> get props => [search];
}

class CategoryListHomePageEvent extends HomePageEvent {
  @override
  List<Object> get props => [];
}
