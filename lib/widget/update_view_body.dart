import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/models/products_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../cubits/update_product_cubit/update_product_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../helper/validate_image_url.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class UpdateViewBody extends StatefulWidget {
  const UpdateViewBody({super.key, required this.product, required this.index});
  final ProductModel product;
  final int index;

  @override
  State<UpdateViewBody> createState() => _UpdateViewBodyState();
}

class _UpdateViewBodyState extends State<UpdateViewBody> {
  String? updateProductName;

  String? updatePrice;

  String? updateImage;

  String? updateCategory;

  final _updateProductKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _updateProductKey,
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
                        return null;
                      },
                      hintText: 'enter product price'),
                  const SizedBox(
                    height: 45,
                  ),
                  CustomButton(
                    text: 'Update',
                    onTap: () async {
                      if (_updateProductKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await imageUrlIsvalid(context);
                        Map<String, String> updatedProductInfo = {
                          'id': '${widget.product.id}',
                          'title': widget.product.title,
                          'price': updatePrice == null
                              ? '${widget.product.price}'
                              : updatePrice!,
                          'description': widget.product.description,
                          'image': updateImage == null
                              ? widget.product.image
                              : updateImage!,
                          'category': updateCategory == null
                              ? widget.product.category
                              : updateCategory!,
                        };
                        await BlocProvider.of<UpdateProductCubit>(context)
                            .updateProduct(
                                bodyAfterUpdate: updatedProductInfo,
                                i: widget.index);

                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> imageUrlIsvalid(BuildContext context) async {
    if (updateImage != null) {
      final validationMessage = await validateImageURL(updateImage!);
      if (validationMessage != null) {
        showSnackBar(context, validationMessage);
      }
    }
  }
}
