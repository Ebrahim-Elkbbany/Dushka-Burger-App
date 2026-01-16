import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/widgets/custom_bottom_nav_bar.dart';
import 'package:dushka_burger/features/menu/presentation/manager/change_category_cubit/change_category_cubit.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/category_header_Sec.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/products_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundBeige,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  int selectedIndex = 0;
                  List<Map<String, String>> products = [];
                  if (state is CategoryUpdated) {
                    selectedIndex = state.selectedIndex;
                    products = state.products;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context.gapH(10),
                      CategoryHeaderSection(
                        selectedIndex: selectedIndex,
                        onTabChanged: (index) {
                          context.read<CategoryCubit>().changeTab(index);
                        },
                      ),
                      context.gapH(5),
                      Expanded(child: ProductsListSection(products: products)),
                    ],
                  );
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
