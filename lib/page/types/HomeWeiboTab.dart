import 'dart:convert';

import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/network/WeiboListBean.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';

class HomeWeiboTab extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: Text('微博热门'));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeWeiboTab();
  }
}

class _HomeWeiboTab extends State<HomeWeiboTab>
    with AutomaticKeepAliveClientMixin {
  List<Contentlist> datas = new List<Contentlist>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    NetWorkHandler.getWeiboLists().then((value) {
      var decode = json.decode(value);
      var weiboListBean = WeiboListBean.fromJson(decode);
      setState(() {
        datas = weiboListBean.showapiResBody.pagebean.contentlist;
      });
    });
//
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        Contentlist data = datas[index];

        return InkWell(
          child: Container(
            child: Text(data.name),
            height: 50,
            alignment: Alignment.center,
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
    );
    ;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
