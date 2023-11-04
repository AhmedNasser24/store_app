part of 'update_product_cubit.dart';

class UpdateProductState {}

class UpdateProductInitial extends UpdateProductState {}
class UpdateProductLoading extends UpdateProductState {}
class UpdateProductSuccess extends UpdateProductState {
  UpdateProductSuccess(this.product, this.cardIndex) ;
  final ProductModel  product ;
  final int cardIndex ;
}
class UpdateProductFailure extends UpdateProductState {
  UpdateProductFailure(this.errMessage) ;
  final String errMessage ;

}