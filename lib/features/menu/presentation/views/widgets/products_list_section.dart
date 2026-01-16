import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';

class ProductsListSection extends StatelessWidget {
  // نستقبل القائمة من الـ Cubit عبر الـ CategoryView
  final List<Map<String, String>> products;

  const ProductsListSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(child: Text("لا توجد منتجات"));
    }

    return ListView.separated(
      padding: EdgeInsets.only(top: context.h(10), bottom: context.h(120)),
      itemCount: products.length,
      separatorBuilder: (context, index) => context.gapH(8),
      itemBuilder: (context, index) {
        return ProductListTile(
          name: products[index]['name'] ?? "",
          price: products[index]['price'] ?? "0",
          imageUrl: products[index]['image'] ?? "",
          onAddTap: () {
            // كود الإضافة لاحقاً
          },
        );
      },
    );
  }
}
