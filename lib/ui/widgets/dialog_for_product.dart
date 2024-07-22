import 'package:dars_61/bloc/products_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogForProduct extends StatefulWidget {
  int id;
  bool isEdit;
  DialogForProduct({super.key,required this.id,required this.isEdit});

  @override
  State<DialogForProduct> createState() => _DialogForProductState();
}

class _DialogForProductState extends State<DialogForProduct> {
  final _formKey = GlobalKey<FormState>();
  final _productTitle = TextEditingController();
  final _productPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${widget.isEdit ? "Product edit" : "Add new product"}"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please,return input product title";
                }

                return null;
              },
              controller: _productTitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Product Title"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please,return input product price";
                }

                try{
                  int.parse(value);
                  return null;
                }catch(e){
                  return "Product price not true";
                }
              },
              controller: _productPrice,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Product price"
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("Cancel"),),
        
        ElevatedButton(onPressed: (){
          if(_formKey.currentState!.validate()){
            if(widget.isEdit){
              context.read<ProductBloc>().add(EditProductProductEvent(widget.id, _productTitle.text, int.parse(_productPrice.text)));
              Navigator.pop(context);
            }
          }
        }, child: widget.isEdit ? Text("Save") : Text("Add Product"))
      ],
    );
  }
}
