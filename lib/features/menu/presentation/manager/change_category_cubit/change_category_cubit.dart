import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dushka_burger/core/use_case/use_case.dart';
import 'package:dushka_burger/features/menu/domain/entities/category_entity.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/get_categories_use_case.dart';

part 'change_category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  List<CategoryEntity> _categories = [];

  CategoryCubit({required this.getCategoriesUseCase})
    : super(CategoryInitial()) {
    loadCategories();
  }

  Future<void> loadCategories() async {
    emit(CategoryLoading());

    final result = await getCategoriesUseCase(const NoParams());

    result.fold((failure) => emit(CategoryError(failure.message)), (
      categories,
    ) {
      _categories = categories;
      if (categories.isNotEmpty) {
        changeTab(0);
      } else {
        emit(CategoryLoaded(categories: [], selectedIndex: 0, products: []));
      }
    });
  }

  void changeTab(int index) {
    if (index >= 0 && index < _categories.length) {
      final category = _categories[index];
      emit(
        CategoryLoaded(
          categories: _categories,
          selectedIndex: index,
          products: category.products,
        ),
      );
    }
  }
}
