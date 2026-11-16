import 'package:dartz/dartz.dart';
import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/core/network/token_storage_service.dart';
import 'package:dushka_burger/features/menu/data/data_sources/menu_remote_data_source.dart';
import 'package:dushka_burger/features/menu/data/models/cart_model.dart';
import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';
import 'package:dushka_burger/features/menu/domain/entities/category_entity.dart';
import 'package:dushka_burger/features/menu/domain/entities/product_details_entity.dart';
import 'package:dushka_burger/features/menu/domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSource remoteDataSource;
  final TokenStorageService tokenStorageService;

  MenuRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenStorageService,
  });

  @override
  Future<Either<Failure, String>> getGuestId() async {
    try {
      // Check if guest ID exists in storage
      final existingGuestId = await tokenStorageService.getGuestId();
      if (existingGuestId != null && existingGuestId.isNotEmpty) {
        return Right(existingGuestId);
      }

      // Get new guest ID from API
      final guestId = await remoteDataSource.getGuestId();
      await tokenStorageService.saveGuestId(guestId);
      return Right(guestId);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(int productId) async {
    try {
      final productDetails = await remoteDataSource.getProductDetails(productId);
      return Right(productDetails);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AddonGroupEntity>>> getProductAddons(int productId) async {
    try {
      final addons = await remoteDataSource.getProductAddons(productId);
      return Right(addons);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart(String guestId) async {
    try {
      final cart = await remoteDataSource.getCart(guestId);
      return Right(cart);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> addToCart({
    required String guestId,
    required int productId,
    required int quantity,
    required List<CartAddonEntity> addons,
  }) async {
    try {
      final addonModels = addons.map((a) => CartAddonModel(
        id: a.id,
        name: a.name,
        price: a.price,
      )).toList();
      
      final cart = await remoteDataSource.addToCart(
        guestId: guestId,
        productId: productId,
        quantity: quantity,
        addons: addonModels,
      );
      return Right(cart);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> deleteFromCart({
    required String guestId,
    required int productId,
    required int quantity,
  }) async {
    try {
      final cart = await remoteDataSource.deleteFromCart(
        guestId: guestId,
        productId: productId,
        quantity: quantity,
      );
      return Right(cart);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}

