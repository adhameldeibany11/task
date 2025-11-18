import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://heavenvally.zeroonez.com/api/',
    ),
  );

  Future<List<dynamic>> getBanners() async {
    try {
      Response response = await _dio.get('get_banners');
      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        return [];
      }
    } catch (e) {
      print('Error $e');
      return [];
    }
  }

  Future<List<dynamic>> getProducts() async {
    try {
      Response response = await _dio.post(
        'get_products',
        data: {
          "page": 1,
        },
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        return [];
      }
    } catch (e) {
      print('Error $e');
      return [];
    }
  }

  Future<List<dynamic>> getServices() async {
    try {
      Response response = await _dio.post(
        'get_services',
        data: {
          "page": 1,
        },
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        return [];
      }
    } catch (e) {
      print('Error $e');
      return [];
    }
  }
}