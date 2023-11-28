import 'dart:async';

import 'package:cavila_store/blocs/fc_comment/event.dart';
import 'package:cavila_store/blocs/fc_comment/repository.dart';
import 'package:cavila_store/blocs/fc_comment/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState>{
  CommentRepository commentRepository;
  CommentBloc(this.commentRepository): super(CommentState()){
    on<SendCommentEvent>(handleSendCommentEvent);
  }


  FutureOr<void> handleSendCommentEvent(SendCommentEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try{
      var res = await commentRepository.commentAndRating(event.comment, event.start, event.productId);
      if(res.statusCode == 200){
        emit(CommentSuccess());
      }else{
        emit(CommentFail());
      }
    }catch(e){
      emit(CommentFail());
    }
  }
}