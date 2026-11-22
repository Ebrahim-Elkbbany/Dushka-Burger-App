import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String guestId;
  final List<CartItemEntity> items;
  final String total;

  const CartEntity({
    required this.guestId,
    required this.items,
    required this.total,
  });

  @override
  List<Object> get props => [guestId, items, total];
}

class CartItemEntity extends Equatable {
  final int productId;
  final String productName;
  final String productImage;
  final int quantity;
  final String price;
  final String total;
  final List<CartAddonEntity> addons;

  const CartItemEntity({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.price,
    required this.total,
    required this.addons,
  });

  @override
  List<Object> get props => [
        productId,
        productName,
        productImage,
        quantity,
        price,
        total,
        addons,
      ];
}

class CartAddonEntity extends Equatable {
  final int id;
  final String name;
  final String price;

  const CartAddonEntity({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  List<Object> get props => [id, name, price];
}



