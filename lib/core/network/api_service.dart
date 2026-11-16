import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/core/network/api_end_points.dart';

class ApiService {
  static const String _username = 'testapp';
  static const String _password = '5S0Q YjyH 4s3G elpe 5F8v u8as';

  static String get _basicAuth {
    final credentials = '$_username:$_password';
    final bytes = utf8.encode(credentials);
    final base64Str = base64.encode(bytes);
    return 'Basic $base64Str';
  }

  static Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': _basicAuth,
  };

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, String>? queryParameters,
  }) async {
    try {
      Uri uri = Uri.parse('${ApiEndPoints.baseUrl}$endpoint');

      if (queryParameters != null && queryParameters.isNotEmpty) {
        uri = uri.replace(queryParameters: queryParameters);
      }

      final response = await http.get(uri, headers: _headers);

      return _handleResponse(response);
    } catch (e) {
      throw NetworkFailure('Network error: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse('${ApiEndPoints.baseUrl}$endpoint');

      final response = await http.post(
        uri,
        headers: _headers,
        body: body != null ? jsonEncode(body) : null,
      );

      return _handleResponse(response);
    } catch (e) {
      throw NetworkFailure('Network error: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> delete({
    required String endpoint,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse('${ApiEndPoints.baseUrl}$endpoint');

      final response = await http.delete(
        uri,
        headers: _headers,
        body: body != null ? jsonEncode(body) : null,
      );

      return _handleResponse(response);
    } catch (e) {
      throw NetworkFailure('Network error: ${e.toString()}');
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return {};
      }
      try {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } catch (e) {
        // If response is not JSON, return as string
        return {'data': response.body};
      }
    } else {
      throw ServerFailure(
        'Server error: ${response.statusCode} - ${response.body}',
      );
    }
  }
}


