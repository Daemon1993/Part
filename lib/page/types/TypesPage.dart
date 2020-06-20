
import 'package:dpart/utils/Log.dart';

import 'HomeNewsTab.dart';
import 'HomeWeiboTab.dart';

import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:flutter/material.dart';

class TypesPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TypesPage();
  }

}

class _TypesPage extends State<TypesPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  List<String> home_tabs_names = ['疫情', '微博热门'];


  TabController _home_tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Log.d("_TypesPage initState");

    _home_tabcontroller =
        TabController(length: home_tabs_names.length, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _home_tabcontroller.dispose();

  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Log.d("_TypesPage build");
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        pageContext: context,
        isBack: false,
        bottom: TabBar(
          tabs: home_tabs_names
              .map((e) => Tab(
            text: e,
          )).toList(),
          controller: _home_tabcontroller,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
        ),
      ),
      body:  Container(child: TabBarView(
        controller: _home_tabcontroller,
        children: <Widget>[HomeNewsTab(), HomeWeiboTab()],
      )
      ),
    );




  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>true;

}