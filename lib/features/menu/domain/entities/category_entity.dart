import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String nameEn;
  final String nameAr;
  final String image;
  final List<ProductEntity> products;

  const CategoryEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.products,
  });

  @override
  List<Object> get props => [id, nameEn, nameAr, image, products];
}

class ProductEntity extends Equatable {
  final int id;
  final String nameEn;
  final String nameAr;
  final String image;
  final String price;
  final String? salePrice;
  final bool onSale;
  final String? descriptionEn;
  final String? descriptionAr;

  const ProductEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.price,
    this.salePrice,
    required this.onSale,
    this.descriptionEn,
    this.descriptionAr,
  });

  @override
  List<Object?> get props => [
        id,
        nameEn,
        nameAr,
        image,
        price,
        salePrice,
        onSale,
        descriptionEn,
        descriptionAr,
      ];
}



