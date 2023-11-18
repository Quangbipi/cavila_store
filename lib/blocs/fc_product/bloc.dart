import 'dart:async';

import 'package:cavila_store/blocs/fc_product/event.dart';
import 'package:cavila_store/blocs/fc_product/repository.dart';
import 'package:cavila_store/blocs/fc_product/state.dart';
import 'package:cavila_store/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
  ProductRepository productRepository;
  ProductBloc(this.productRepository): super(ProductState()){
    on<GetProductEvent>(handleGetProductEvent);
  }


  FutureOr<void> handleGetProductEvent(GetProductEvent event, Emitter<ProductState> emit) async {
    emit(GetProductLoading());
    try{
      var res = await productRepository.getProduct();
      if(res.statusCode == 200){
        List<Product> products = productFromJson(res.body);
        emit(GetProductSuccess(products));
      }
    }catch(e){
      emit(GetProductFail(e.toString()));
    }
  }
}