part of 'product_bloc.dart';
sealed class ProductEvent{}

final class GetAllProductProductEvent extends ProductEvent{}

final class DeleteProductProductEvent extends ProductEvent{
  int id;

  DeleteProductProductEvent(this.id);
}

final class AddProductProductEvent extends ProductEvent{
  int id;
  Map<String,dynamic> mp;

  AddProductProductEvent(this.id,this.mp);
}

final class EditProductProductEvent extends ProductEvent{
  int id;
  Map<String,dynamic> mp;

  EditProductProductEvent(this.id,this.mp);
}