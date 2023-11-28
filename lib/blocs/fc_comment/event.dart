import 'package:equatable/equatable.dart';

class CommentEvent extends Equatable{
  
  @override
  List<Object?> get props => [];

}

class SendCommentEvent extends CommentEvent{
  final String comment;
  final String start;
  final String productId;

  SendCommentEvent(this.comment, this.start, this.productId);
}