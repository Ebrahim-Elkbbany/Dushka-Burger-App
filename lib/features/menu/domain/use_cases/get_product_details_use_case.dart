import 'package:dartz/dartz.dart';
import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/core/use_case/use_case_with_param.dart';
import 'package:dushka_burger/features/menu/domain/entities/product_details_entity.dart';
import 'package:dushka_burger/features/menu/domain/repositories/menu_repository.dart';

class GetProductDetailsUseCase implements UseCaseWithParam<ProductDetailsEntity, int> {
  final MenuRepository repository;

  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ProductDetailsEntity>> call(int productId) async {
    return await repository.getProductDetails(productId);
  }
}



