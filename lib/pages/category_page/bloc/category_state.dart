part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryErrorState extends CategoryState {
  final String? message;
  CategoryErrorState({this.message});
  @override
  List<Object?> get props => [message];
}

class CategoryInitial extends CategoryState {
  final List<CategoriesModel>? categoriesModel;
  final ProductModel? productModel;

  CategoryInitial({this.categoriesModel, this.productModel});

  @override
  List<Object?> get props => [categoriesModel, productModel];

  CategoryInitial copyWith({
    List<CategoriesModel>? categoriesModel,
    ProductModel? productModel,
  }) =>
      CategoryInitial(
          categoriesModel: categoriesModel ?? this.categoriesModel,
          productModel: productModel ?? this.productModel);
}
