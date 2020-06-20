



import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';

class LoadingBaseLayout extends StatefulWidget{

  Widget child_widget;

  _LoadingBaseLayout loadingBaseLayout;

  bool loading=true;

  String tag;

  LoadingBaseLayout({this.child_widget,this.loading,this.tag});

  
  @override
  State<StatefulWidget> createState() {



    return _LoadingBaseLayout();
  }

}

class _LoadingBaseLayout extends State<LoadingBaseLayout>{

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return widget.loading?Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(strokeWidth:2.0),
      ),
    ):widget.child_widget;
  }



}