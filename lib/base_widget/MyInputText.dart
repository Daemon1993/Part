import 'package:dpart/utils/Log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInputText extends StatefulWidget {
  String hintText;
  String labelText;
  double width=350;

  var prefixIcon;

  TextEditingController controller;

  MyInputText({Key key,
    this.width,
    this.hintText='',
    this.labelText='',
    this.prefixIcon,
    @required this.controller,
  }
  );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InutTextState();
  }
}

class _InutTextState extends State<MyInputText>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
//    widget.controller.addListener(()=>{
//
//    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData themeData = Theme.of(context);

    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      width: 350,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefixIcon: Icon(Icons.person),


        ),
      ),
    );
  }

}
