import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubits/get_product_cubit/get_product_cubit.dart';
import '../widget/custom_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'New Trend',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.black,
                )),
          ],
        ),
        body: BlocBuilder<GetProductCubit, GetProductState>(
          builder: (context, state) {
            if (state is GetProductSuccess) {
              return CustomGridView(productList: state.productList);
            } else if (state is GetProductFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            }
          },
        ));
  }
}
