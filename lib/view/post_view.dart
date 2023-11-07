import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_form_field.dart';

import '../widget/post_view_body.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});
  static String id = 'post view';
  
  @override
  Widget build(BuildContext context) {
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
      body: const PostViewBody()
    );
  }
}
