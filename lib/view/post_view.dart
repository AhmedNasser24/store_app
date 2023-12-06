import 'package:flutter/material.dart';

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
