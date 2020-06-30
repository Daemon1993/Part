import 'dart:convert';


import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/network/NewListBean.dart';
import 'package:dpart/network/response/GankHotResponse.dart';

import 'package:dpart/page/types/TypesPage.dart';
import 'package:dpart/page/user/MyPage.dart';
import 'package:dpart/page/user/UserPage.dart';
import 'package:dpart/page/wandroid/WAndroidHomePage.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'girl/GirlPage.dart';
import 'hot/HotPage.dart';
import 'types/HomeNewsTab.dart';

class HomePage extends StatefulWidget {
  String name;

  HomePage({Key key, this.name}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // TODO: implement build
  int _selectIndex = 0;

  List<String> bottoms_module_names = ['热门','分类','福利','W安卓','我的'];

  final bodyList=[
    HotPage() ,
    TypesPage(),
    GirlPage(),
    WAndroidHomePage(),
    MyPage(),
//    UserPage(url:'https://github.com/Daemon1993',title:'Daemon')
  ];

  final pageController=PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();

  }

  void onPageChanged(int index) {
    setState(() {
      _selectIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body:PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children:bodyList,
        physics: NeverScrollableScrollPhysics(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        //设置显示的模式
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(bottoms_module_names[0])),
          BottomNavigationBarItem(
              icon: Icon(Icons.subject),
              title: Text(bottoms_module_names[1])),
          BottomNavigationBarItem(
              icon: Icon(Icons.tag_faces),
              title: Text(bottoms_module_names[2])),
          BottomNavigationBarItem(
              icon: Icon(Icons.android),
              title: Text(bottoms_module_names[3])),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(bottoms_module_names[4])),
        ],
        currentIndex: _selectIndex,
        onTap: _onItemTaped,
      ),
    );
  }

  void _onItemTaped(int value) {
    pageController.jumpToPage(value);

    setState(() {
      _selectIndex = value;
    });
  }


}
