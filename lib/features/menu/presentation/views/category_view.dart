import 'package:dushka_burger/core/di/service_locator.dart';
import 'package:dushka_burger/core/extensions/size_config_extension.dart';
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
      create: (context) => CategoryCubit(getCategoriesUseCase: sl()),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CategoryError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.message),
                          ElevatedButton(
                            onPressed: () {
                              context.read<CategoryCubit>().loadCategories();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is CategoryLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        context.gapH(10),
                        CategoryHeaderSection(
                          categories: state.categories,
                          selectedIndex: state.selectedIndex,
                          onTabChanged: (index) {
                            context.read<CategoryCubit>().changeTab(index);
                          },
                        ),
                        context.gapH(5),
                        Expanded(
                          child: ProductsListSection(products: state.products),
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
