import 'package:equatable/equatable.dart';

class AddProductSate extends Equatable{
  @override
  List<Object?> get props => [];

}

class AddProductLoading extends AddProductSate{

}

class AddProductSuccess extends AddProductSate{
  final String productId;
  final String size;
  final String color;

  AddProductSuccess(this.productId, this.size, this.color);

}

class AddProductFail extends AddProductSate {

}