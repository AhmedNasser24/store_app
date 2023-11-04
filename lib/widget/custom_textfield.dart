import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';



class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.onChanged ,
    required this.hintText,
    this.validator,
    this.keyboardType,
  });
  Function(String)? onChanged ;
  final String hintText;
  TextInputType? keyboardType ;
  String? Function(String?)? validator ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ,
      keyboardType: TextInputType.datetime,
      onChanged: onChanged ,
      decoration: InputDecoration(
        hintText: hintText,
        
        hintStyle: const TextStyle(color: Colors.grey , fontSize: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
