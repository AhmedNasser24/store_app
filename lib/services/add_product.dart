import 'package:store_app/constants.dart';
import 'package:store_app/helper/store_api.dart';
import 'package:store_app/models/products_model.dart';

class AddProductService {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String desc,
      required String img,
      required String category}) async {
    Map < String , dynamic > data = await StoreApi().post(url: baseUrl , body: {
      "title": title,
      'price': price,
      'description': desc,
      'image': img,
      'category': category,
    });

    return ProductModel.fromJson(data) ;
  }
}
