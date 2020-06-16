


import 'package:dpart/base_widget/MyAppBar.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      title: 'Home',
      home: _HomePage(context),
    );
  }

}

class _HomePage extends StatefulWidget {
  BuildContext parent_context;

  _HomePage(BuildContext context){
    parent_context=context;
  }



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<_HomePage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        title: 'HomePageState',
        pageContext: widget.parent_context,
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}