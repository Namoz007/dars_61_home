import 'package:dars_61/data/models/product.dart';
import 'package:dars_61/network/product_dio_network.dart';

class ProductRepositories{
  final _productDioNetwork = ProductDioNetwork();

  Future<List<Product>> getAllProducts() async{
    return await _productDioNetwork.get(url: '',);
  }

  Future<void> deleteProduct(String url) async{
    await _productDioNetwork.delete(url);
  }

  Future<void> updateProduct(String url,Map<String,dynamic> mp) async{
    await _productDioNetwork.update(url,mp);
  }

  Future<void> addProduct(Map<String,dynamic> mp) async{
    await _productDioNetwork.post(mp);
  }
}