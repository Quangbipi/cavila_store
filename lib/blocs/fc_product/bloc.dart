import 'dart:async';

import 'package:cavila_store/blocs/fc_product/event.dart';
import 'package:cavila_store/blocs/fc_product/repository.dart';
import 'package:cavila_store/blocs/fc_product/state.dart';
import 'package:cavila_store/models/cart_model.dart';
import 'package:cavila_store/models/product.dart';
import 'package:cavila_store/models/product_gender.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(ProductState()) {
    on<GetProductEvent>(handleGetProductEvent);
    on<GetNewProductEvent>(handleGetNewProductEvent);
    on<GetProductGenderEvent>(handleGetProductGenderEvent);
    on<AddProductToCart>(handleAddProductToCart);
    on<GetProductFromCartEvent>(handleGetProductFromCartEvent);
    on<DeleteProductInCart>(handleDeleteProductInCart);
  }

  FutureOr<void> handleGetProductEvent(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(GetProductLoading());
    try {
      var res = await productRepository.getProduct();
      if (res.statusCode == 200) {
        List<Product> products = productFromJson(res.body);
        emit(GetProductSuccess(products));
      }
    } catch (e) {
      print(e.toString());
      emit(GetProductFail(e.toString()));
    }
  }

  FutureOr<void> handleGetNewProductEvent(
      GetNewProductEvent event, Emitter<ProductState> emit) async {
    emit(GetProductLoading());
    try {
      var res = await productRepository.getNewProduct();
      if (res.statusCode == 200) {
        List<Product> products = productFromJson(res.body);
        emit(GetNewProductSuccess(products));
      }
    } catch (e) {
      emit(GetNewProductFail(e.toString()));
    }
  }


  FutureOr<void> handleGetProductGenderEvent(GetProductGenderEvent event, Emitter<ProductState> emit)async{
    emit(GetProductLoading());
    try {
      var res = await productRepository.getProductGender(event.key);
      if (res.statusCode == 200) {
        ProductGender productGender = productGenderFromJson(res.body);
        emit(GetProductGenderSuccess(productGender));
      }
    } catch (e) {
      emit(GetProductGenderFail(e.toString()));
    }
  }

  FutureOr<void> handleAddProductToCart(AddProductToCart event, Emitter<ProductState> emit) async{
    emit(AddProductLoading());
     try {
      var res = await productRepository.addProductToCart(event.productId, event.size, event.color, event.token);
      if (res.statusCode == 200) {
        
        emit(AddProductSuccess());
      }else{
        emit(AddProductFail());
      }
    } catch (e) {
      emit(AddProductFail());
    }
  }

  FutureOr<void> handleGetProductFromCartEvent(GetProductFromCartEvent event, Emitter<ProductState> emit) async {
    emit(GetProductFromCartLoading());
    try{
      var res = await productRepository.getCart();
      if(res.statusCode == 200){
        CartModel cartModel = cartModelFromJson(res.body);
        emit(GetProductFromCartSuccess(cartModel));
      }else{
        emit(GetProductFromCartFail());
      }
    }catch(e){
      emit(GetProductFromCartFail());
    }
  }

  FutureOr<void> handleDeleteProductInCart(DeleteProductInCart event, Emitter<ProductState> emit) async {
    emit(DeleteProductInCartLoading());
    try{
      var res =await productRepository.deleteProductInCart(event.productId);
      if(res.statusCode == 200){
        emit(DeleteProductInCartSuccess());
      }else{
        emit(DeleteProductInCartFail());
      }
    }catch(e){
      emit(DeleteProductInCartFail());
    }
  }
}
// bloc prductPage
class GetFemaleProductBloc extends Bloc<ProductEvent, ProductState>{
  ProductRepository productRepository;
  GetFemaleProductBloc(this.productRepository) : super(ProductState()) {
    on<GetProductGenderLEvent>(handleGetProductGenderLEvent);
  }
  FutureOr<void> handleGetProductGenderLEvent(
      GetProductGenderLEvent event, Emitter<ProductState> emit) async {
    emit(GetProductLoading());
    try {
      var res = await productRepository.getProductGenderM(event.key);
      if (res.statusCode == 200) {
        ProductGender productGender = productGenderFromJson(res.body);
        emit(GetProductGenderLSuccess(productGender));
      }
    } catch (e) {
      
      emit(GetProductGenderLFail(e.toString()));     
    }
  }
}

class GetMaleProductBloc extends Bloc<ProductEvent, ProductState>{
  ProductRepository productRepository;
  GetMaleProductBloc(this.productRepository) : super(ProductState()) {
    on<GetProductGenderMEvent>(handleGetProductGenderMEvent);
  }
  FutureOr<void> handleGetProductGenderMEvent(
      GetProductGenderMEvent event, Emitter<ProductState> emit) async {
    emit(GetProductLoading());
    try {
      var res = await productRepository.getProductGenderL(event.key);
      if (res.statusCode == 200) {
        ProductGender productGender = productGenderFromJson(res.body);
        emit(GetProductGenderMSuccess(productGender));
      }
    } catch (e) {
      emit(GetProductGenderMFail(e.toString()));
    }
  }
}

 