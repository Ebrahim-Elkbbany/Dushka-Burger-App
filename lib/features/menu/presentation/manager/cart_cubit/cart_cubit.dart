import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dushka_burger/core/use_case/use_case.dart';
import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/add_to_cart_use_case.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/delete_from_cart_use_case.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/get_cart_use_case.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/get_guest_id_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetGuestIdUseCase getGuestIdUseCase;
  final GetCartUseCase getCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  final DeleteFromCartUseCase deleteFromCartUseCase;
  
  String? _guestId;

  CartCubit({
    required this.getGuestIdUseCase,
    required this.getCartUseCase,
    required this.addToCartUseCase,
    required this.deleteFromCartUseCase,
  }) : super(CartInitial()) {
    loadCart();
  }

  Future<void> loadCart() async {
    emit(CartLoading());
    
    // Get or create guest ID
    final guestIdResult = await getGuestIdUseCase(const NoParams());
    
    guestIdResult.fold(
      (failure) => emit(CartError(failure.message)),
      (guestId) async {
        _guestId = guestId;
        final cartResult = await getCartUseCase(guestId);
        
        cartResult.fold(
          (failure) => emit(CartError(failure.message)),
          (cart) => emit(CartLoaded(cart: cart)),
        );
      },
    );
  }

  Future<void> addToCart({
    required int productId,
    required int quantity,
    required List<CartAddonEntity> addons,
  }) async {
    if (_guestId == null) {
      emit(CartError('Guest ID not available'));
      return;
    }

    emit(CartLoading());
    
    final result = await addToCartUseCase(AddToCartParams(
      guestId: _guestId!,
      productId: productId,
      quantity: quantity,
      addons: addons,
    ));
    
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cart) => emit(CartLoaded(cart: cart)),
    );
  }

  Future<void> deleteFromCart({
    required int productId,
    required int quantity,
  }) async {
    if (_guestId == null) {
      emit(CartError('Guest ID not available'));
      return;
    }

    emit(CartLoading());
    
    final result = await deleteFromCartUseCase(DeleteFromCartParams(
      guestId: _guestId!,
      productId: productId,
      quantity: quantity,
    ));
    
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cart) => emit(CartLoaded(cart: cart)),
    );
  }

  Future<void> refreshCart() async {
    if (_guestId != null) {
      await loadCart();
    }
  }
}

