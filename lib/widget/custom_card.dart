import 'package:flutter/material.dart';

import '../models/products_model.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.product,
    super.key,  
  });
  
  final ProductModel product;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.grey.withOpacity(0.2),
              blurStyle: BlurStyle.normal,
              offset: const Offset(1, 1),
            )
          ]),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                   Text(
                    product.category
                    ,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${product.price}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const Spacer(),
                      const Icon(Icons.favorite, color: Colors.grey),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: -35,
          child: Image(
            height: 100,
            width: 80,
            image: NetworkImage(product.image),
          ),
        ),
      ],
    );
  }
}
