import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_form_field.dart';

class PostView extends StatelessWidget {
  PostView({super.key});
  static String id = 'post view';
  final _enterNewProductParameterKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    late String title;
    late String price;
    late String desc;
    late String image;
    late String category;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'add new product',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _enterNewProductParameterKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    title = data;
                  },
                  hintText: 'title',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty , enter title';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'price',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty , enter price';
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
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty , enter description';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image url',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty , enter image url';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    category = data;
                  },
                  hintText: 'category',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty , enter category';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: 'Add product',
                    onTap: () async {
                      if (_enterNewProductParameterKey.currentState!
                          .validate()) {
                        await BlocProvider.of<GetProductCubit>(context)
                            .addNewProduct(
                                title: title,
                                price: price,
                                desc: desc,
                                image: image,
                                category: category);
                        Navigator.pop(context);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
