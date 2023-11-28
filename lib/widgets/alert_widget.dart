import 'package:cavila_store/blocs/fc_comment/bloc.dart';
import 'package:cavila_store/blocs/fc_comment/event.dart';
import 'package:cavila_store/blocs/fc_comment/state.dart';
import 'package:cavila_store/constans.dart';
import 'package:cavila_store/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class AlertWidget extends StatefulWidget {
  final String productId;
  const AlertWidget({super.key, required this.productId});

  @override
  State<AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  int startSelect = -1;
  TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: BlocListener<CommentBloc, CommentState>(
        listener: (context, state){
                
              },
        child: AlertDialog(
           shape: RoundedRectangleBorder( // hoặc null
            borderRadius: BorderRadius.circular(5), // hoặc 0
          ),
          backgroundColor: Colors.white,
          titlePadding: const EdgeInsets.all(5),
          title: Container(
            decoration: BoxDecoration(color: Constants.secondaryColor),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_outlined,
                      size: 32,
                      color: Colors.white,
                    )),
                const Text(
                  'Đánh giá sản phẩm',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          contentPadding: const EdgeInsets.all(5),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index){
                      return IconButton(
                        onPressed: (){
                          setState(() {
                            startSelect = index;
                          });
                        }, icon: Icon(Icons.star, color: index <= startSelect ? Constants.secondaryColor : null,));
                }),
                  
                ),
                TextField(
                  controller: comment,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    
                    hintText: 'Đánh giá',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10,),
                WidgetButton.buildButtonSmall(50, 110, (){
                  context.read<CommentBloc>().add(SendCommentEvent(comment.text, (startSelect+1).toString(), widget.productId));
                  Navigator.pop(context);
                }, 'Đánh giá')
              ],
            ),
          ),
        
        ),
      ),
    );
  }
}
