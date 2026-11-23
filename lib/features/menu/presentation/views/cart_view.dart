import 'package:dushka_burger/core/di/service_locator.dart';
import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/core/widgets/custom_bottom_nav_bar.dart';
import 'package:dushka_burger/core/widgets/custom_cached_network_image.dart';
import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';
import 'package:dushka_burger/features/menu/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(
        getGuestIdUseCase: sl(),
        getCartUseCase: sl(),
        addToCartUseCase: sl(),
        deleteFromCartUseCase: sl(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                  if (state is CartError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.message),
                          ElevatedButton(
                            onPressed: () {
                              context.read<CartCubit>().loadCart();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }
                  
                  if (state is CartLoaded) {
                    final cart = state.cart;
                    
                    if (cart.items.isEmpty) {
                      return const Center(
                        child: Text('Your cart is empty'),
                      );
                    }
                    
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.all(context.w(20)),
                            itemCount: cart.items.length,
                            separatorBuilder: (context, index) => context.gapH(16),
                            itemBuilder: (context, index) {
                              final item = cart.items[index];
                              return CartItemCard(
                                item: item,
                                onDelete: () {
                                  context.read<CartCubit>().deleteFromCart(
                                    productId: item.productId,
                                    quantity: item.quantity,
                                  );
                                },
                                onQuantityChanged: (newQuantity) {
                                  if (newQuantity > item.quantity) {
                                    // Add more
                                    context.read<CartCubit>().addToCart(
                                      productId: item.productId,
                                      quantity: newQuantity - item.quantity,
                                      addons: item.addons,
                                    );
                                  } else if (newQuantity < item.quantity) {
                                    // Remove some
                                    context.read<CartCubit>().deleteFromCart(
                                      productId: item.productId,
                                      quantity: item.quantity - newQuantity,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(context.w(20)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, -5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: AppTextStyles.sectionTitle(context),
                                  ),
                                  Text(
                                    '${cart.total} EGP',
                                    style: AppTextStyles.productPrice(context),
                                  ),
                                ],
                              ),
                              context.gapH(16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // TODO: Navigate to checkout
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryRed,
                                    padding: EdgeInsets.symmetric(vertical: context.h(16)),
                                  ),
                                  child: Text(
                                    'Checkout',
                                    style: AppTextStyles.buttonText(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  
                  return const SizedBox.shrink();
                },
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomBottomNavBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItemEntity item;
  final VoidCallback onDelete;
  final Function(int) onQuantityChanged;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomCachedNetworkImage(
            imageUrl: item.productImage,
            width: context.w(80),
            height: context.w(80),
            radius: 8,
            fit: BoxFit.cover,
          ),
          context.gapW(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: AppTextStyles.productName(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                context.gapH(8),
                Text(
                  '${item.price} EGP',
                  style: AppTextStyles.productPrice(context),
                ),
                if (item.addons.isNotEmpty) ...[
                  context.gapH(4),
                  Text(
                    'Addons: ${item.addons.map((a) => a.name).join(', ')}',
                    style: AppTextStyles.productName(context).copyWith(
                      fontSize: context.sp(12),
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                context.gapH(8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: item.quantity > 1
                          ? () => onQuantityChanged(item.quantity - 1)
                          : null,
                    ),
                    Text(
                      '${item.quantity}',
                      style: AppTextStyles.productName(context),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => onQuantityChanged(item.quantity + 1),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      color: Colors.red,
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

