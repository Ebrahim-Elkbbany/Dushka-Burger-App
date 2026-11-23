import 'package:dushka_burger/core/di/service_locator.dart';
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
  final int productId;
  
  const ProductDetailsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(repository: sl())..loadProductDetails(productId),
      child: Scaffold(
        appBar: productDetailsAppBar(context),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            
            if (state is ProductDetailsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProductDetailsCubit>().loadProductDetails(productId);
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            
            if (state is ProductDetailsLoaded) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.w(20)),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ProductHeaderImage(imageUrl: state.product.image),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  context.gapH(16),
                                  ProductInfoSection(
                                    product: state.product,
                                    quantity: state.quantity,
                                    onQuantityChanged: (quantity) {
                                      context.read<ProductDetailsCubit>().updateQuantity(quantity);
                                    },
                                  ),
                                  context.gapH(20),
                                  ProductAddonsSection(
                                    addonGroups: state.addonGroups,
                                    selectedAddonIds: state.selectedAddonIds,
                                    onAddonToggled: (addonId) {
                                      context.read<ProductDetailsCubit>().toggleAddon(addonId);
                                    },
                                  ),
                                  context.gapH(100),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      AddToCartBottomSheet(
                        product: state.product,
                        quantity: state.quantity,
                        selectedAddonIds: state.selectedAddonIds,
                        addonGroups: state.addonGroups,
                        onQuantityChanged: (quantity) {
                          context.read<ProductDetailsCubit>().updateQuantity(quantity);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
