import 'package:equatable/equatable.dart';

class ProductEvent extends Equatable{
  
  @override
  List<Object?> get props => [];

}

class GetProductEvent extends ProductEvent{
  
}

class GetProductGenderMEvent extends ProductEvent{
  final String key;
  GetProductGenderMEvent(this.key);
}

class GetProductGenderLEvent extends ProductEvent{
  final String key;
  GetProductGenderLEvent(this.key);
}


class GetNewProductEvent extends ProductEvent{
  
}

class GetProductGenderEvent extends ProductEvent{
  final String key;
  GetProductGenderEvent(this.key);
}

class AddProductToCart extends ProductEvent {
  final String productId; 
  final String size; 
  final String color; 
  final String token;

  AddProductToCart(this.productId, this.size, this.color, this.token);

}

class GetProductFromCartEvent extends ProductEvent{
  
}

class DeleteProductInCart extends ProductEvent{
  final String productId;
  DeleteProductInCart(this.productId);
}