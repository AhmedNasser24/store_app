import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/widget/loading.dart';

import '../cubits/get_product_cubit/get_product_cubit.dart';
import '../widget/custom_grid_view.dart';
import '../widget/show_error_message.dart';
import 'post_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, PostView.id);
          },
          child: const Icon(Icons.add),
        ),
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
              // Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<GetProductCubit>(context).getAllProduct();
              },
              icon: const Icon(
                Icons.replay,
                color: Colors.black,
              ),
            ),
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
              return ShowErrorMessage(errMessage: state.errMessage);
            } else {
              return const Loading() ;
            }
          },
        ));
  }
}
