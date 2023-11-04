import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/products_model.dart';
import '../../services/updata_product.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateProductInitial());

  updateProduct(
      {required Map<String, String> bodyAfterUpdate, required int i}) async {
    emit(UpdateProductLoading());
    try {
      ProductModel product = await UpdateProductService()
          .updateProduct(bodyAfterUpdate: bodyAfterUpdate);

      emit(UpdateProductSuccess(product, i));
    } catch (e) {
      emit(UpdateProductFailure(e.toString()));
    }
  }
}
