

import '../constants.dart';
import '../helper/store_api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllProduct() async {
    List<dynamic> data = await StoreApi().getData(url: '$baseUrl/categories');

    return data;
  }
}
