import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/features/menu/domain/entities/category_entity.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';

class ProductsListSection extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductsListSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text('No products available'));
    }
    
    return ListView.separated(
      padding: EdgeInsets.only(top: context.h(10)),
      itemCount: products.length,
      separatorBuilder: (context, index) => context.gapH(8),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductListTile(
          name: product.nameEn,
          price: product.onSale && product.salePrice != null 
              ? product.salePrice! 
              : product.price,
          imageUrl: product.image,
          onAddTap: () {
            // TODO: Navigate to product details
          },
        );
      },
    );
  }
}
