import 'dart:convert';

import 'package:dpart/base_widget/Gaps.dart';
import 'package:dpart/base_widget/MyAppBar.dart';
import 'package:dpart/item_widget/NewListWidget.dart';
import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/network/NewListBean.dart';
import 'package:dpart/page/home/HomeWeiboTab.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/HomeNewsTab.dart';

class HomePage extends StatefulWidget {
  String name;

  HomePage({Key key, this.name});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // TODO: implement build
  int _selectIndex = 0;

  List<String> bottoms_module_names = ['首页', '我的'];
  List<String> home_tabs_names = ['疫情', '微博热门'];



  TabController _home_tabcontroller;

  Container center_layout;

  Map<String, Container> _temp_center_layout_caches = new Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _home_tabcontroller =
        TabController(length: home_tabs_names.length, vsync: this);

//    _home_tabcontroller.addListener((){
//      Log.d("  "+_home_tabcontroller.index.toString());
//    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _home_tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: bottoms_module_names[_selectIndex],
        pageContext: context,
        isBack: false,
        bottom: _selectIndex == 0
            ? TabBar(
                tabs: home_tabs_names
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList(),
                controller: _home_tabcontroller,
              )
            : null,
      ),
      body:IndexedStack(
        index: _selectIndex,
        children: <Widget>[
          Container(child: TabBarView(
            controller: _home_tabcontroller,
            children: <Widget>[HomeNewsTab(), HomeWeiboTab()],
          )),
          Container(child: Text('我的')),
        ],
      ),
//      body: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[center_layout],
//      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(bottoms_module_names[0])),
          BottomNavigationBarItem(
              icon: Icon(Icons.tag_faces),
              title: Text(bottoms_module_names[1])),
        ],
        currentIndex: _selectIndex,
        onTap: _onItemTaped,
      ),
    );
  }

  void _onItemTaped(int value) {
    setState(() {
      _selectIndex = value;
    });
  }
}
