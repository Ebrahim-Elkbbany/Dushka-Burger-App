import 'package:dushka_burger/features/menu/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  const ProductDetailsModel({
    required super.id,
    required super.nameEn,
    required super.nameAr,
    required super.image,
    required super.price,
    super.salePrice,
    required super.onSale,
    required super.descriptionEn,
    required super.descriptionAr,
    required super.addonGroups,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'] as int,
      nameEn: json['name_en'] as String? ?? json['name'] as String? ?? '',
      nameAr: json['name_ar'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: json['price'] as String? ?? '0',
      salePrice: json['sale_price'] as String?,
      onSale: json['on_sale'] as bool? ?? false,
      descriptionEn: json['description_en'] as String? ?? '',
      descriptionAr: json['description_ar'] as String? ?? '',
      addonGroups: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'price': price,
      'sale_price': salePrice,
      'on_sale': onSale,
      'description_en': descriptionEn,
      'description_ar': descriptionAr,
    };
  }
}

class AddonGroupModel extends AddonGroupEntity {
  const AddonGroupModel({
    required super.id,
    required super.nameEn,
    required super.nameAr,
    required super.items,
    required super.isRequired,
    required super.minSelection,
    required super.maxSelection,
  });

  factory AddonGroupModel.fromJson(Map<String, dynamic> json) {
    return AddonGroupModel(
      id: json['id'] as int,
      nameEn: json['name_en'] as String? ?? '',
      nameAr: json['name_ar'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => AddonItemModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      isRequired: json['is_required'] as bool? ?? false,
      minSelection: json['min_selection'] as int? ?? 0,
      maxSelection: json['max_selection'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'items': items.map((i) => (i as AddonItemModel).toJson()).toList(),
      'is_required': isRequired,
      'min_selection': minSelection,
      'max_selection': maxSelection,
    };
  }
}

class AddonItemModel extends AddonItemEntity {
  const AddonItemModel({
    required super.id,
    required super.nameEn,
    required super.nameAr,
    required super.price,
  });

  factory AddonItemModel.fromJson(Map<String, dynamic> json) {
    return AddonItemModel(
      id: json['id'] as int,
      nameEn: json['name_en'] as String? ?? '',
      nameAr: json['name_ar'] as String? ?? '',
      price: json['price'] as String? ?? '0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'price': price,
    };
  }
}



