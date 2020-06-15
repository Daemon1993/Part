

import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  String name;

  Color bg_color;

  double borderRadius;

  VoidCallback action;
  double width;
  double height;


  MyButton({Key key,
    this.name = '',
    this.bg_color,
    this.borderRadius=6,
    this.action,
    this.width=100,
    this.height=50,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(this.bg_color==null){
      this.bg_color=Theme.of(context).primaryColor;
    }
    return Material(
      child: InkWell(
        splashColor: Colors.green[200],
        borderRadius: BorderRadius.circular(this.borderRadius),
         child:Container(
           width: width,
           height: height,
           child: Center(
               child: Text(name,style: TextStyle(color: Colors.white,fontSize: 16))
           ),
         ),
        onTap:
          this.action
        ,
      ),
      color:this.bg_color,
      borderRadius: BorderRadius.circular(this.borderRadius),
    );
  }


}