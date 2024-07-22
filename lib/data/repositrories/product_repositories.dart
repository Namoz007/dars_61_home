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

  Future<void> updateProduct(String url,String title,int price) async{
    await _productDioNetwork.update(url, title, price);
  }
}