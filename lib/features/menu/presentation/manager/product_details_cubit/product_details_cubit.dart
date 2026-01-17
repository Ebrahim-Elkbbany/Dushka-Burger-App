import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void loadProductDetails(int productId) {
    // TODO: Implement API call
    emit(ProductDetailsLoading());
    // Simulate loading for UI dev
    Future.delayed(const Duration(seconds: 1), () {
      emit(ProductDetailsLoaded());
    });
  }

  void updateQuantity(int quantity) {
    // TODO: Update state
  }

  void toggleAddon(String addonId) {
    // TODO: Handle addon selection
  }
}
