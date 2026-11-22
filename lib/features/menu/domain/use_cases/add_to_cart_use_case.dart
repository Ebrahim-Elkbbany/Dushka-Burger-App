import 'package:dartz/dartz.dart';
import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/core/use_case/use_case_with_param.dart';
import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';
import 'package:dushka_burger/features/menu/domain/repositories/menu_repository.dart';

class AddToCartParams {
  final String guestId;
  final int productId;
  final int quantity;
  final List<CartAddonEntity> addons;

  AddToCartParams({
    required this.guestId,
    required this.productId,
    required this.quantity,
    required this.addons,
  });
}

class AddToCartUseCase
    implements UseCaseWithParam<CartEntity, AddToCartParams> {
  final MenuRepository repository;

  AddToCartUseCase(this.repository);

  @override
  Future<Either<Failure, CartEntity>> call(AddToCartParams params) async {
    return await repository.addToCart(
      guestId: params.guestId,
      productId: params.productId,
      quantity: params.quantity,
      addons: params.addons,
    );
  }
}


