import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/core/network/api_end_points.dart';
import 'package:dushka_burger/core/network/api_service.dart';
import 'package:dushka_burger/features/menu/data/models/cart_model.dart';
import 'package:dushka_burger/features/menu/data/models/category_model.dart';
import 'package:dushka_burger/features/menu/data/models/product_details_model.dart';

abstract class MenuRemoteDataSource {
  Future<String> getGuestId();
  Future<List<CategoryModel>> getCategories();
  Future<ProductDetailsModel> getProductDetails(int productId);
  Future<List<AddonGroupModel>> getProductAddons(int productId);
  Future<CartModel> getCart(String guestId);
  Future<CartModel> addToCart({
    required String guestId,
    required int productId,
    required int quantity,
    required List<CartAddonModel> addons,
  });
  Future<CartModel> deleteFromCart({
    required String guestId,
    required int productId,
    required int quantity,
  });
}

class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final ApiService apiService;

  MenuRemoteDataSourceImpl({required this.apiService});

  @override
  Future<String> getGuestId() async {
    try {
      final response = await apiService.get(endpoint: ApiEndPoints.getGuestId);
      final guestId = response['guest_id'] as String? ?? response['data'] as String?;
      if (guestId == null) {
        throw ServerFailure('Invalid guest ID response');
      }
      return guestId;
    } catch (e) {
      if (e is Failure) rethrow;
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await apiService.get(endpoint: ApiEndPoints.getCategories);
      
      if (response['data'] != null) {
        final List<dynamic> data = response['data'] as List<dynamic>;
        return data.map((json) => CategoryModel.fromJson(json as Map<String, dynamic>)).toList();
      }
      
      if (response is List) {
        return (response as List<dynamic>)
            .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      
      return [];
    } catch (e) {
      if (e is Failure) rethrow;
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<ProductDetailsModel> getProductDetails(int productId) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndPoints.getProductDetails,
        queryParameters: {'product_id': productId.toString()},
      );
      
      if (response['data'] != null) {
        final data = response['data'] as List<dynamic>;
        if (data.isNotEmpty) {
          return ProductDetailsModel.fromJson(data.first as Map<String, dynamic>);
        }
      }
      
      if (response is List && (response as List).isNotEmpty) {
        return ProductDetailsModel.fromJson((response as List).first as Map<String, dynamic>);
      }
      
      throw ServerFailure('Product not found');
    } catch (e) {
      if (e is Failure) rethrow;
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<AddonGroupModel>> getProductAddons(int productId) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndPoints.getProductAddons,
        queryParameters: {'product_id2': productId.toString()},
      );
      
      if (response['data'] != null) {
        final List<dynamic> data = response['data'] as List<dynamic>;
        return data.map((json) => AddonGroupModel.fromJson(json as Map<String, dynamic>)).toList();
      }
      
      if (response is List) {
        return (response as List<dynamic>)
            .map((json) => AddonGroupModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      
      return [];
    } catch (e) {
      if (e is Failure) rethrow;
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<CartModel> getCart(String guestId) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndPoints.getCart,
        queryParameters: {'guest_id': guestId},
      );
      
      return CartModel.fromJson(response);
    } catch (e) {
      if (e is Failure) rethrow;
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<CartModel> addToCart({
    required String guestId,
    required int productId,
    required int quantity,
    required List<CartAddonModel> addons,
  }) async {
    try {
      final body = {
        'guest_id': guestId,
        'items': [
          {
            'product_id': productId,
            'quantity': quantity,
            'addons': addons.map((a) => {
              'id': a.id,
              'name': a.name,
              'price': a.price,
            }).toList(),
          }
        ],
      };
      
      final response = await apiService.post(
        endpoint: ApiEndPoints.addToCart,
        body: body,
      );
      
      return CartModel.fromJson(response);
    } catch (e) {
      if (e is Failure) rethrow;
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<CartModel> deleteFromCart({
    required String guestId,
    required int productId,
    required int quantity,
  }) async {
    try {
      final body = {
        'guest_id': guestId,
        'product_id': productId,
        'quantity': quantity,
      };
      
      final response = await apiService.delete(
        endpoint: ApiEndPoints.deleteFromCart,
        body: body,
      );
      
      return CartModel.fromJson(response);
    } catch (e) {
      if (e is Failure) rethrow;
      throw ServerFailure(e.toString());
    }
  }
}

