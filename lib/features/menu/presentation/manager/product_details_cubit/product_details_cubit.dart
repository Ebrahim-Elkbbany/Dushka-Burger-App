import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dushka_burger/features/menu/domain/entities/product_details_entity.dart';
import 'package:dushka_burger/features/menu/domain/repositories/menu_repository.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final MenuRepository repository;

  ProductDetailsCubit({required this.repository}) : super(ProductDetailsInitial());

  Future<void> loadProductDetails(int productId) async {
    emit(ProductDetailsLoading());
    
    final productResult = await repository.getProductDetails(productId);
    final addonsResult = await repository.getProductAddons(productId);
    
    productResult.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (product) {
        addonsResult.fold(
          (failure) => emit(ProductDetailsError(failure.message)),
          (addonGroups) {
            emit(ProductDetailsLoaded(
              product: product,
              addonGroups: addonGroups,
              quantity: 1,
              selectedAddonIds: [],
            ));
          },
        );
      },
    );
  }

  void updateQuantity(int quantity) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;
      if (quantity > 0) {
        emit(currentState.copyWith(quantity: quantity));
      }
    }
  }

  void toggleAddon(int addonId) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;
      final selectedAddons = List<int>.from(currentState.selectedAddonIds);
      
      if (selectedAddons.contains(addonId)) {
        selectedAddons.remove(addonId);
      } else {
        selectedAddons.add(addonId);
      }
      
      emit(currentState.copyWith(selectedAddonIds: selectedAddons));
    }
  }
}
