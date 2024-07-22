part of 'product_bloc.dart';
sealed class ProductState{}

final class InitialProductState extends ProductState{}

final class LoadingProductState extends ProductState{}

final class LoadedProductState extends ProductState{
  List<Product> products;

  LoadedProductState(this.products);
}


final class ErrorProductState extends ProductState{}