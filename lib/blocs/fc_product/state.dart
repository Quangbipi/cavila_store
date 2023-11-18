import 'package:cavila_store/models/product.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable{
  @override
  List<Object?> get props => [];

}

class GetProductLoading extends ProductState{

}

class GetProductSuccess extends ProductState{
  final List<Product> products;

  GetProductSuccess(this.products);
  
}

class GetProductFail extends ProductState{
  final String e;
  GetProductFail(this.e);
}