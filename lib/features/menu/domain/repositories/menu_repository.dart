import 'package:dartz/dartz.dart';
import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';
import 'package:dushka_burger/features/menu/domain/entities/category_entity.dart';
import 'package:dushka_burger/features/menu/domain/entities/product_details_entity.dart';

abstract class MenuRepository {
  Future<Either<Failure, String>> getGuestId();

  Future<Either<Failure, List<CategoryEntity>>> getCategories();

  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(
    int productId,
  );

  Future<Either<Failure, List<AddonGroupEntity>>> getProductAddons(
    int productId,
  );

  Future<Either<Failure, CartEntity>> getCart(String guestId);

  Future<Either<Failure, CartEntity>> addToCart({
    required String guestId,
    required int productId,
    required int quantity,
    required List<CartAddonEntity> addons,
  });

  Future<Either<Failure, CartEntity>> deleteFromCart({
    required String guestId,
    required int productId,
    required int quantity,
  });
}


