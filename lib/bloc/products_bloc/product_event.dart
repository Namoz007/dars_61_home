part of 'product_bloc.dart';
sealed class ProductEvent{}

final class GetAllProductProductEvent extends ProductEvent{}

final class DeleteProductProductEvent extends ProductEvent{
  int id;

  DeleteProductProductEvent(this.id);
}

final class AddProductProductEvent extends ProductEvent{

}

final class EditProductProductEvent extends ProductEvent{
  int id;
  String title;
  int price;

  EditProductProductEvent(this.id,this.title,this.price);
}