part of 'change_category_cubit.dart';
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryUpdated extends CategoryState {
  final int selectedIndex;
  final List<Map<String, String>> products;

  CategoryUpdated({required this.selectedIndex, required this.products});
}
