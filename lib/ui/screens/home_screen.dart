import 'package:dars_61/bloc/products_bloc/product_bloc.dart';
import 'package:dars_61/data/models/product.dart';
import 'package:dars_61/ui/widgets/dialog_for_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetAllProductProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context) => DialogForProduct(id: 0, isEdit: false));
          }, icon: const Icon(Icons.add),),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }

          if (state is LoadedProductState) {
            return state.products.length == 0 ? const Center(child: Text("Hozircha mahsulotlar mavjud emas!"),) :  ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                Product product = state.products[index];
                return Container(
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage("${product.category['image']}"),
                      fit: BoxFit.cover
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${product.title}",style: TextStyle(color: Colors.yellowAccent),),
                                Text("\$${product.price}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.yellow),)
                              ],
                            ),
                          ),
                          Expanded(flex: 1,child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: (){
                                  showDialog(context: context, builder: (context) => DialogForProduct(id: product.id, isEdit: true));
                                },
                                child: Icon(Icons.edit),
                              ),
                              const SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                  context.read<ProductBloc>().add(DeleteProductProductEvent(product.id));
                                },
                                child: Icon(Icons.delete,color: Colors.red,),
                              ),
                            ],
                          ),),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
