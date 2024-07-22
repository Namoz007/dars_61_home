import 'package:dars_61/bloc/products_bloc/product_bloc.dart';
import 'package:dars_61/data/repositrories/product_repositories.dart';
import 'package:dars_61/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ProductRepositories()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductBloc(repo: context.read<ProductRepositories>())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen()
        ),
      ),
    );
  }
}
