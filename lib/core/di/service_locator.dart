import 'package:get_it/get_it.dart';
import 'package:dushka_burger/core/network/api_service.dart';
import 'package:dushka_burger/core/network/token_storage_service.dart';
import 'package:dushka_burger/features/menu/data/data_sources/menu_remote_data_source.dart';
import 'package:dushka_burger/features/menu/data/repositories/menu_repository_impl.dart';
import 'package:dushka_burger/features/menu/domain/repositories/menu_repository.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/add_to_cart_use_case.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/delete_from_cart_use_case.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/get_cart_use_case.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/get_categories_use_case.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/get_guest_id_use_case.dart';
import 'package:dushka_burger/features/menu/domain/use_cases/get_product_details_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => ApiService());
  sl.registerLazySingleton(() => TokenStorageService());

  // Data sources
  sl.registerLazySingleton<MenuRemoteDataSource>(
    () => MenuRemoteDataSourceImpl(apiService: sl()),
  );

  // Repositories
  sl.registerLazySingleton<MenuRepository>(
    () => MenuRepositoryImpl(
      remoteDataSource: sl(),
      tokenStorageService: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetGuestIdUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetCartUseCase(sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(sl()));
  sl.registerLazySingleton(() => DeleteFromCartUseCase(sl()));
}

