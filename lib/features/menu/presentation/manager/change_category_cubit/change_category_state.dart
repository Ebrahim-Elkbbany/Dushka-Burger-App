part of 'change_category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  final int selectedIndex;
  final List<ProductEntity> products;

  CategoryLoaded({
    required this.categories,
    required this.selectedIndex,
    required this.products,
  });
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}
