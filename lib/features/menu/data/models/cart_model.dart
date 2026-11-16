import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.guestId,
    required super.items,
    required super.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      guestId: json['guest_id'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      total: json['total'] as String? ?? '0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guest_id': guestId,
      'items': items.map((i) => (i as CartItemModel).toJson()).toList(),
      'total': total,
    };
  }
}

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.productId,
    required super.productName,
    required super.productImage,
    required super.quantity,
    required super.price,
    required super.total,
    required super.addons,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product_id'] as int,
      productName: json['product_name'] as String? ?? '',
      productImage: json['product_image'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 1,
      price: json['price'] as String? ?? '0',
      total: json['total'] as String? ?? '0',
      addons: (json['addons'] as List<dynamic>?)
              ?.map((addon) => CartAddonModel.fromJson(addon as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'quantity': quantity,
      'price': price,
      'total': total,
      'addons': addons.map((a) => (a as CartAddonModel).toJson()).toList(),
    };
  }
}

class CartAddonModel extends CartAddonEntity {
  const CartAddonModel({
    required super.id,
    required super.name,
    required super.price,
  });

  factory CartAddonModel.fromJson(Map<String, dynamic> json) {
    return CartAddonModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      price: json['price'] as String? ?? '0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}



