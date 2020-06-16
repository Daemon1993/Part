


import 'package:dpart/base_widget/MyAppBar.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  String name;

  HomePage({this.name});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // TODO: implement build
  int _selectIndex=0;

  @override
  Widget build(BuildContext context) {

    var resultCenter=Text('Home');
    if(_selectIndex==1){
      resultCenter=Text('My');
    }

    return Scaffold(
      appBar: MyAppBar(
        title: '首页',
        pageContext: context,
        isBack: false,
      ),
      body: Container(

        child: Column(
          children: <Widget>[
            Text(widget.name),
            resultCenter
          ],
        )
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),

          BottomNavigationBarItem(icon: Icon(Icons.tag_faces), title: Text('我的')),
        ],
        currentIndex: _selectIndex,
        onTap: _onItemTaped,
      ),
    );
  }
  void _onItemTaped(int value) {
    setState(() {
      _selectIndex=value;
    });
  }

}