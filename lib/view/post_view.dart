import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_form_field.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});
  static String id = 'post view';
  @override
  Widget build(BuildContext context) {
    late String title ; 
    late String price ; 
    late String desc ; 
    late String image ; 
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              CustomTextFormField(
                onChanged: (data) {
                  title = data ;
                },
                hintText: 'title',
                validator: (p0) {},
              ),
              const SizedBox(height: 10,),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                onChanged: (data) {
                  price = data ;
                },
                hintText: 'price',
                validator: (p0) {},
              ),
              const SizedBox(height: 10,),
              CustomTextFormField(
                onChanged: (data) {
                  desc = data ;
                },
                hintText: 'description',
                validator: (p0) {},
              ),
              const SizedBox(height: 10,),
              CustomTextFormField(
                onChanged: (data) {
                  image = data ;
                },
                hintText: 'image url',
                validator: (p0) {},
              ),
              const SizedBox(height: 10,),
              CustomTextFormField(
                onChanged: (data) {
                  category = data ;
                },
                hintText: 'category',
                validator: (p0) {},
              ),
              const SizedBox(height: 20,),
              CustomButton(text: 'Add product', onTap: () async{

                await BlocProvider.of<GetProductCubit>(context).addNewProduct(title: title, price: price, desc: desc, image: image, category: category) ;
                Navigator.pop(context) ;
              })
            ],
          ),
        ),
      ),
    );
  }
}
