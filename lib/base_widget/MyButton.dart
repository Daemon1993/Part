

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
    this.bg_color = Colors.grey,
    this.borderRadius=6,
    this.action,
    this.width=100,
    this.height=50,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: InkWell(
        splashColor: Colors.green[200],
         child:Container(
           width: width,
           height: height,
           child: Center(
               child: Text('button',style: TextStyle(color: Colors.white,fontSize: 16))
           ),
         ),
        onTap:
          this.action
        ,
      ),
      color:Colors.grey,
      borderRadius: BorderRadius.circular(this.borderRadius),
    );
  }


}