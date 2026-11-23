import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
  final int id;
  final String nameEn;
  final String nameAr;
  final String image;
  final String price;
  final String? salePrice;
  final bool onSale;
  final String descriptionEn;
  final String descriptionAr;
  final List<AddonGroupEntity> addonGroups;

  const ProductDetailsEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.price,
    this.salePrice,
    required this.onSale,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.addonGroups,
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
        addonGroups,
      ];
}

class AddonGroupEntity extends Equatable {
  final int id;
  final String nameEn;
  final String nameAr;
  final List<AddonItemEntity> items;
  final bool isRequired;
  final int minSelection;
  final int maxSelection;

  const AddonGroupEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.items,
    required this.isRequired,
    required this.minSelection,
    required this.maxSelection,
  });

  @override
  List<Object> get props => [
        id,
        nameEn,
        nameAr,
        items,
        isRequired,
        minSelection,
        maxSelection,
      ];
}

class AddonItemEntity extends Equatable {
  final int id;
  final String nameEn;
  final String nameAr;
  final String price;

  const AddonItemEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.price,
  });

  @override
  List<Object> get props => [id, nameEn, nameAr, price];
}



