part of 'get_product_cubit.dart';

class GetProductState {}

class GetProductInitial extends GetProductState {}
class GetProductLoading extends GetProductState {}
class GetProductSuccess extends GetProductState {
  GetProductSuccess(this.productList) ;
  final List < ProductModel > productList ;
}
class GetProductFailure extends GetProductState {
  GetProductFailure(this.errMessage) ;
  final String errMessage ;

}
