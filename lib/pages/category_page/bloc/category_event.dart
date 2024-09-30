part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryInitialEvent extends CategoryEvent {}

class CategoryListEvent extends CategoryEvent {
  String url;
  CategoryListEvent({required this.url});
}
