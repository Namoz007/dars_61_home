import 'dart:async';
import 'package:dars_61/data/models/product.dart';
import 'package:dio/dio.dart';

class ProductDioNetwork{
  final _dio = Dio();

  ProductDioNetwork._private() {
    _dio.options
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15)
    ..baseUrl = "https://api.escuelajs.co/api/v1/products";
    // ..baseUrl = "http://213.230.108.186:5555/api/v1";
  }

  Future<void> post(Map<String,dynamic> mp) async{
    print('kjhjkhlkhlkkhjk');
    try{
      await _dio.post('',data: mp);
    }catch(e){
      print("xatolik: ${e}");
    }
  }


  Future<void> update(String url,Map<String,dynamic> mp) async{
    try {
      final response = await _dio.put(url, data: mp);
      print("Bu natija: ${response.data}");
    } catch (e) {
      if (e is DioError) {
        print('Xatolik yuz berdi: ${e.message}');
        if (e.response != null) {
          print('Xato javobi: ${e.response?.data}');
          print('Xato status kodi: ${e.response?.statusCode}');
        }
      } else {
        print('Xatolik yuz berdi: $e');
      }
    }
  }

  Future<void> delete(String url) async{
    await _dio.delete(url);
  }

  Future<List<Product>> get({required String url}) async{
    List<Product> _products = [];
    final response = await _dio.get(url);
    print("bu $response");
    List<dynamic> lst = response.data as List<dynamic>;
    for(int i = 0; i < lst.length;i++)
      _products.add(Product.fromJson(lst[i]));
    return _products;
  }


  static final _singletonConstructor = ProductDioNetwork._private();
  factory ProductDioNetwork() {
    return _singletonConstructor;
  }
}