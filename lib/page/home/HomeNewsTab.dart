import 'dart:convert';

import 'package:dpart/item_widget/NewListWidget.dart';
import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/network/NewListBean.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';

class HomeNewsTab extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeNewsTabState();
  }
}

class _HomeNewsTabState extends State<HomeNewsTab> with AutomaticKeepAliveClientMixin {
  List<Contentlist> datas = new List<Contentlist>();
  _HomeNewsTabState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    NwtWorkHandler.getNewLists("新冠病毒").then((value) {
      var decode = json.decode(value);
      NewListsBean newListsBean = new NewListsBean.fromJson(decode);

      setState(() {
        datas = newListsBean.showapiResBody.pagebean.contentlist;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        Contentlist data = datas[index];

        return InkWell(
          child: NewListWidget(data: data),
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
    )
    ;
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
