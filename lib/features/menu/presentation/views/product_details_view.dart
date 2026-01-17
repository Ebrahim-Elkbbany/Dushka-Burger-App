import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/features/menu/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/add_to_cart_bottom_sheet.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/product_addons_section.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/product_details_app_bar_sec.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/product_header_image.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/product_info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..loadProductDetails(1),
      child: Scaffold(
        appBar: productDetailsAppBar(context),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w(20)),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ProductHeaderImage(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            context.gapH(16),
                            const ProductInfoSection(),
                            context.gapH(20),
                            const ProductAddonsSection(),
                            context.gapH(100),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const AddToCartBottomSheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
