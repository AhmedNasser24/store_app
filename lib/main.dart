import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/get_product_cubit/get_product_cubit.dart';
import 'cubits/update_product_cubit/update_product_cubit.dart';
import 'view/home_view.dart';
import 'view/post_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => GetProductCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => UpdateProductCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.id: (context) => const HomeView(),
          PostView.id :(context) =>  PostView() ,
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
