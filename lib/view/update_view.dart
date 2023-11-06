import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/update_product_cubit/update_product_cubit.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_form_field.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key, required this.product, required this.index});
  static String id = 'update view';
  final ProductModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    String? updateProductName;
    String? updatePrice;
    String? updateImage;
    String? updateCategory;
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                    onChanged: (data) {
                      updateProductName = data;
                    },
                    hintText: 'enter product name'),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                    onChanged: (data) {
                      updateImage = data;
                    },
                    hintText: 'enter image url '),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                    onChanged: (data) {
                      updateCategory = data;
                    },
                    hintText: 'enter product category'),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (data) {
                      updatePrice = data;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      }
                      if (value.startsWith('0')) {
                        return 'Price cannot start with a leading zero';
                      }
                      final num? x = double.tryParse(value);
                      if (x == null) {
                        return 'enter valid price ';
                      }
                      if (x <= 0) {
                        return 'enter postive price';
                      }
                      return null ;
                    },
                    hintText: 'enter product price'),
                const SizedBox(
                  height: 45,
                ),
                CustomButton(
                    text: 'Update',
                    onTap: () async {
                      await BlocProvider.of<UpdateProductCubit>(context)
                          .updateProduct(bodyAfterUpdate: {
                        'id': '${product.id}',
                        'title': product.title,
                        'price': updatePrice == null
                            ? '${product.price}'
                            : updatePrice!,
                        'description': product.description,
                        'image':
                            updateImage == null ? product.image : updateImage!,
                        'category': updateCategory == null
                            ? product.category
                            : updateCategory!,
                      }, i: index);
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
