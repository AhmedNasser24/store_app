import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/all_product.dart';

import '../../services/add_product.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit() : super(GetProductInitial()) {
    getAllProduct();
  }
  List<ProductModel> productList = [];
  Future<void> getAllProduct() async {
    emit(GetProductLoading());
    try {
      productList = await GetAllProductService().getAllProduct();
      emit(GetProductSuccess(productList));
    } catch (e) {
      emit(GetProductFailure(e.toString()));
    }
  }

  Future<void> addNewProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    emit(GetProductLoading());
    try {
      ProductModel newProduct = await AddProductService().addProduct(
          title: title,
          price: price,
          desc: desc,
          img: image,
          category: category);
          print ( 'newProduct : ${newProduct.price}') ;
      productList.add(newProduct);
      emit(GetProductSuccess(productList));
    } catch (e) {
      emit(GetProductFailure(e.toString()));
    }
  }
}
