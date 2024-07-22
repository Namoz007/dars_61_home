import 'package:bloc/bloc.dart';
import 'package:dars_61/data/repositrories/product_repositories.dart';

import '../../data/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositories _productRepositories;
  List<Product> _products = [];
  ProductBloc({required ProductRepositories repo})
      : _productRepositories = repo,
        super(
          InitialProductState(),
        ) {
    on<GetAllProductProductEvent>(_getAllProducts);
    on<DeleteProductProductEvent>(_deleteProduct);
    on<EditProductProductEvent>(_editProduct);
  }

  Future<void> _editProduct(EditProductProductEvent event,emit) async{
    emit(LoadingProductState());
    await _productRepositories.updateProduct("/${event.id}", event.title, event.price);
    _products = await _productRepositories.getAllProducts();
    emit(LoadedProductState(_products));
  }

  Future<void> _deleteProduct(DeleteProductProductEvent event,emit) async{
    emit(LoadingProductState());
    await _productRepositories.deleteProduct("/${event.id}");
    await _productRepositories.getAllProducts();
    emit(LoadedProductState(_products));
  }

  Future<void> _getAllProducts(GetAllProductProductEvent event, emit) async{
    emit(LoadingProductState());
    _products = await _productRepositories.getAllProducts();
    emit(LoadedProductState(_products));
  }
}
