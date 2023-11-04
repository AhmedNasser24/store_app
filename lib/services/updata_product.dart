import 'package:store_app/constants.dart';
import 'package:store_app/helper/store_api.dart';
import 'package:store_app/models/products_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {
        
        required Map < String ,String > bodyAfterUpdate }) async {
    Map<String, dynamic> data =
        await StoreApi().put(url: '$baseUrl/${bodyAfterUpdate['id']}', body: bodyAfterUpdate );

    return ProductModel.fromJson(data);
  }
}
