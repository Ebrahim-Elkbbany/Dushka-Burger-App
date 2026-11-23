import 'package:dushka_burger/features/menu/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.nameEn,
    required super.nameAr,
    required super.image,
    required super.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      nameEn: json['name_en'] as String? ?? '',
      nameAr: json['name_ar'] as String? ?? '',
      image: json['image'] as String? ?? '',
      products: (json['products'] as List<dynamic>?)
              ?.map((product) => ProductModel.fromJson(product as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'products': products.map((p) => (p as ProductModel).toJson()).toList(),
    };
  }
}

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.nameEn,
    required super.nameAr,
    required super.image,
    required super.price,
    super.salePrice,
    required super.onSale,
    super.descriptionEn,
    super.descriptionAr,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      nameEn: json['name_en'] as String? ?? json['name'] as String? ?? '',
      nameAr: json['name_ar'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: json['price'] as String? ?? '0',
      salePrice: json['sale_price'] as String?,
      onSale: json['on_sale'] as bool? ?? false,
      descriptionEn: json['description_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
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



