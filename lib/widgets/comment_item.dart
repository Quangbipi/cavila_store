import 'package:cavila_store/constans.dart';
import 'package:cavila_store/models/product.dart';
import 'package:flutter/material.dart';

class CommentItem {
  static Widget commentWidget(Comment comment) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg'),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.userName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Row(
              children: List.generate(comment.rating, (index) {
                return Icon(
                  Icons.star,
                  size: 12,
                  color: Constants.secondaryColor,
                );
              }),
            ),
            Text(
              comment.comment,
              style: TextStyle(fontSize: 14))
          ],
        )
      ],
    );
  }
}
