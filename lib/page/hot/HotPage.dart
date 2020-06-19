import 'dart:convert';

import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/network/response/GankHotResponse.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'HotItemLayout.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HotPageState();
  }
}

class _HotPageState extends State<HotPage> {
  List<Data> datas = new List<Data>();

  EasyRefreshController _controller = new EasyRefreshController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDatas(true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: MyAppBar(
        title: Text('热门'),
        isBack: false,
      ),
      body: EasyRefresh(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Data data = datas[index];

            return InkWell(
              child: HotItemLayout(data: data),
              onTap: () {
                Log.d("click item");
              },
            );
          },
          itemCount: datas.length,
        ),
        controller: _controller,
        header: ClassicalHeader(),
        onRefresh: () async {
          Log.d("onrefresh");
          getDatas(true);
        },
        enableControlFinishRefresh: false,
      ),
    );
  }

  void getDatas(bool isfresh) {
    NetWorkHandler.getGankHotList().then((value) {
      var decode = json.decode(value);
      GankHotResponse gankHotResponse = new GankHotResponse.fromJson(decode);

      if (isfresh) {
        datas.clear();
      }

      setState(() {
        datas.addAll(gankHotResponse.data);
      });
    });
  }
}
