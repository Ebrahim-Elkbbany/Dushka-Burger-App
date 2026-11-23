import 'package:dartz/dartz.dart';
import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/core/use_case/use_case_with_param.dart';
import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';
import 'package:dushka_burger/features/menu/domain/repositories/menu_repository.dart';

class GetCartUseCase implements UseCaseWithParam<CartEntity, String> {
  final MenuRepository repository;

  GetCartUseCase(this.repository);

  @override
  Future<Either<Failure, CartEntity>> call(String guestId) async {
    return await repository.getCart(guestId);
  }
}


