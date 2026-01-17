part of 'product_details_cubit.dart';

abstract class ProductDetailsState {
  const ProductDetailsState();
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  // TODO: Add Product Entity when created
  const ProductDetailsLoaded();
}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  const ProductDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
