import 'package:dartz/dartz.dart';
import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/core/use_case/use_case_with_param.dart';
import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';
import 'package:dushka_burger/features/menu/domain/repositories/menu_repository.dart';

class DeleteFromCartParams {
  final String guestId;
  final int productId;
  final int quantity;

  DeleteFromCartParams({
    required this.guestId,
    required this.productId,
    required this.quantity,
  });
}

class DeleteFromCartUseCase
    implements UseCaseWithParam<CartEntity, DeleteFromCartParams> {
  final MenuRepository repository;

  DeleteFromCartUseCase(this.repository);

  @override
  Future<Either<Failure, CartEntity>> call(DeleteFromCartParams params) async {
    return await repository.deleteFromCart(
      guestId: params.guestId,
      productId: params.productId,
      quantity: params.quantity,
    );
  }
}


