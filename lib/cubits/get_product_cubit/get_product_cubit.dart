import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/all_product.dart';
import 'package:store_app/services/updata_product.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit() : super(GetProductInitial()) {
    getAllProduct();
  }
  
  getAllProduct() async {
    emit(GetProductLoading());
    try {
      List<ProductModel> productList =
          await GetAllProductService().getAllProduct();
      emit(GetProductSuccess(productList));
    } catch (e) {
      emit(GetProductFailure(e.toString()));
    }
  }

  
}
