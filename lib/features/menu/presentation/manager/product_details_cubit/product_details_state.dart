part of 'product_details_cubit.dart';

abstract class ProductDetailsState {
  const ProductDetailsState();
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetailsEntity product;
  final List<AddonGroupEntity> addonGroups;
  final int quantity;
  final List<int> selectedAddonIds;

  const ProductDetailsLoaded({
    required this.product,
    required this.addonGroups,
    this.quantity = 1,
    this.selectedAddonIds = const [],
  });

  ProductDetailsLoaded copyWith({
    ProductDetailsEntity? product,
    List<AddonGroupEntity>? addonGroups,
    int? quantity,
    List<int>? selectedAddonIds,
  }) {
    return ProductDetailsLoaded(
      product: product ?? this.product,
      addonGroups: addonGroups ?? this.addonGroups,
      quantity: quantity ?? this.quantity,
      selectedAddonIds: selectedAddonIds ?? this.selectedAddonIds,
    );
  }
}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  const ProductDetailsError(this.message);
}
