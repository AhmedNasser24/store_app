import 'package:flutter/material.dart';

import '../cubits/update_product_cubit/update_product_cubit.dart';
import '../models/products_model.dart';
import '../view/update_view.dart';
import 'custom_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading.dart';
import 'show_error_message.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: GridView.builder(
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 50,
            crossAxisSpacing: 5,
            // mainAxisExtent: 150,
            childAspectRatio: 1.3),
        itemCount: productList.length,
        itemBuilder: (context, index) =>
            BlocBuilder<UpdateProductCubit, UpdateProductState>(
          builder: (context, state) {
            if (state is UpdateProductSuccess) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateView(
                        product: state.cardIndex == index
                            ? state.product
                            : productList[index],
                        index: index),
                  ),
                ),
                child: CustomCard(
                  product: state.cardIndex == index
                      ? state.product
                      : productList[index],
                ),
              );
            } else if (state is UpdateProductFailure) {
              return ShowErrorMessage(
                errMessage: state.errMessage,
              );
            } else if (state is UpdateProductLoading) {
              return const Loading();
            } else {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UpdateView(product: productList[index], index: index),
                  ),
                ),
                child: CustomCard(
                  product: productList[index],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

