import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial()) {
    // عند البداية، اعرض القائمة الأولى
    changeTab(0);
  }

  // الداتا (لاحقاً ستأتي من API)
  final List<Map<String, String>> _dushkaOffers = [
    {
      "name": "بيج بايت بوكس",
      "price": "249",
      "image":
          "https://dushkaburger.com/wp-content/uploads/2026/01/Big-Bite-Box.jpg",
    },
    {
      "name": "تشيز أوفرلود بوكس",
      "price": "179",
      "image":
          "https://dushkaburger.com/wp-content/uploads/2026/01/Cheese-Overload-Box.jpg",
    },
  ];

  final List<Map<String, String>> _appOffers = [
    {
      "name": "عرض الصحاب",
      "price": "150",
      "image":
          "https://dushkaburger.com/wp-content/uploads/2026/01/friends.jpg",
    },
    {
      "name": "كومبو التوفير",
      "price": "85",
      "image": "https://dushkaburger.com/wp-content/uploads/2026/01/saver.jpg",
    },
  ];

  void changeTab(int index) {
    if (index == 0) {
      emit(CategoryUpdated(selectedIndex: 0, products: _dushkaOffers));
    } else {
      emit(CategoryUpdated(selectedIndex: 1, products: _appOffers));
    }
  }
}
