

import 'package:flutter/material.dart';

class Base_item_right_layout extends StatelessWidget{
  VoidCallback action;

  final name;

  Base_item_right_layout({this.name='name',this.action});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  InkWell(
      onTap: (){
        if(this.action!=null){
          this.action();
        }
      },
      child:Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        height: 50,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name),
            Icon(Icons.arrow_right)
          ],
        ),
      ) ,
    );
  }


}