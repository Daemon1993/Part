import 'dart:convert';

import 'package:dpart/base_widget/MyAppBar.dart';
import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/network/NewListBean.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String name;

  HomePage({Key key, this.name});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // TODO: implement build
  int _selectIndex = 0;


  List<Contentlist> datas=new List<Contentlist>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     NwtWorkHandler.getNewLists("新冠病毒").then((value){
      var decode = json.decode(value);
      NewListsBean newListsBean = new NewListsBean.fromJson(decode);

      setState(() {
        datas=newListsBean.showapiResBody.pagebean.contentlist;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    var resultCenter = Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {

          Contentlist data = datas[index];

          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.all(5),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(data.title,maxLines: 2,overflow: TextOverflow.ellipsis,),
              height: 35,
              width: 100,
            ),
            onTap: () {
              Log.d("click item");
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: datas.length,
      ),
    );

    if (_selectIndex == 1) {
      resultCenter = Expanded(child: Text('My'));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: '首页',
        pageContext: context,
        isBack: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[ resultCenter],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.tag_faces), title: Text('我的')),
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
