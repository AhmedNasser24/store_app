import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/constants.dart';
import 'package:store_app/models/products_model.dart';

import '../helper/store_api.dart';

class GetCategoriesService {
  Future<List<ProductModel>> getAllProduct(
      {required String categoryName}) async {
    List<dynamic> data =
        await StoreApi().getData(url: "$baseUrl/category/$categoryName");
    List<ProductModel> categoryList = [];
    for (var category in data) {
      categoryList.add(ProductModel.fromJson(category));
    } 
    return categoryList;
  }
}
