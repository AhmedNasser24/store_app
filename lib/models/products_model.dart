import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RateModel? rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id']  ,
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating:jsonData['rating'] == null ? null :  RateModel.fromJson(jsonData['rating']) ,
    );
  }
}

class RateModel {
  final num rate;
  final num count;
  RateModel({
    required this.rate,
    required this.count,
  });
  factory RateModel.fromJson(jsonData) {
    return RateModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
