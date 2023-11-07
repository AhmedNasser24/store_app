import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/products_model.dart';
import '../widget/update_view_body.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key, required this.product, required this.index});
  static String id = 'update view';
  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              )),
          backgroundColor: kPrimairyColor,
          centerTitle: true,
          title: const Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: UpdateViewBody(product: product, index: index));
  }
}
