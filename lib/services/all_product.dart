import 'package:store_app/models/products_model.dart';

import '../constants.dart';
import '../helper/store_api.dart';

class GetAllProductService {
  List<ProductModel> productList = [];
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data = await StoreApi().getData(url: baseUrl);
    
    for (var product in data) {
      productList.add(ProductModel.fromJson(product));
    }
    return productList;
  }
}
