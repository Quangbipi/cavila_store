import 'package:cavila_store/models/product.dart';
import 'package:cavila_store/models/product_gender.dart';
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

class GetProductGenderSuccess extends ProductState{
  final ProductGender productGender;

  GetProductGenderSuccess(this.productGender);
  
}

class GetProductGenderFail extends ProductState{
  final String e;
  GetProductGenderFail(this.e);
}


class GetProductGenderMSuccess extends ProductState{
  final ProductGender productGender;

  GetProductGenderMSuccess(this.productGender);
  
}

class GetProductGenderMFail extends ProductState{
  final String e;
  GetProductGenderMFail(this.e);
}

class GetProductGenderLSuccess extends ProductState{
  final ProductGender productGender;

  GetProductGenderLSuccess(this.productGender);
  
}

class GetProductGenderLFail extends ProductState{
  final String e;
  GetProductGenderLFail(this.e);
}

class GetNewProductSuccess extends ProductState{
  final List<Product> products;

  GetNewProductSuccess(this.products);
  
}

class GetNewProductFail extends ProductState{
  final String e;
  GetNewProductFail(this.e);
}

class AddProductLoading extends ProductState{

}

class AddProductSuccess extends ProductState{

}

class AddProductFail extends ProductState {

}