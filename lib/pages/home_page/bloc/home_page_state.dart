part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {}

class HomePageInitialState extends HomePageState {
  final ProductModel? productModel;
  final List? categoryList;
  HomePageInitialState({this.productModel, this.categoryList});

  @override
  List<Object?> get props => [productModel, categoryList];

  HomePageInitialState copyWith({
    ProductModel? productModel,
    List? categoryList,
  }) =>
      HomePageInitialState(
        productModel: productModel ?? this.productModel,
        categoryList: categoryList ?? this.categoryList,
      );
}

class HomePageLoadingState extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageErrorState extends HomePageState {
  HomePageErrorState({this.message});
  final String? message;
  @override
  List<Object?> get props => [message];
}

class HomeSucessState extends HomePageState {
  final String? successMessage;
  HomeSucessState({this.successMessage});

  @override
  List<Object?> get props => [successMessage];

  HomeSucessState copyWith({String? successMessage}) => HomeSucessState(
        successMessage: successMessage ?? this.successMessage,
      );
}

class HomePageSearchState extends HomePageState {
  final ProductModel? productModel;
  HomePageSearchState({this.productModel});

  @override
  List<Object?> get props => [productModel];

  HomePageSearchState copyWith({
    ProductModel? productModel,
  }) =>
      HomePageSearchState(
        productModel: productModel ?? this.productModel,
      );
}
