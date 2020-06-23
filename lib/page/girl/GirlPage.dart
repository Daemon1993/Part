import 'dart:convert';

import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/page/girl/GirlRandomResponse.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/widget/base_widget/LoadingBaseLayout.dart';
import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class GirlPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GirlPage();
  }
}

class _GirlPage extends State<GirlPage> with AutomaticKeepAliveClientMixin {
  List<Data> datas = new List<Data>();

  EasyRefreshController _controlor = new EasyRefreshController();

  bool loading = true;
  bool isFirst = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Log.d("_GirlPage initState");
    getDatas();
  }

  void outLazyData() {
    if (isFirst) {
      getDatas();
    } else {
      Log.d("outLazyData 拦截");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    Log.d("_GirlPage build");
    return Scaffold(
        appBar: const MyAppBar(
          title: Text('福利'),
          isBack: false,
        ),
        body: LoadingBaseLayout(
          child_widget: EasyRefresh(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Log.d("-----onTap");
                    },
                    child: Container(
                      height: 80,
                      child: Image.network(datas[index].url),
                    ));
              },
              itemCount: datas.length,
            ),
            enableControlFinishRefresh: false,
            controller: _controlor,
            header: ClassicalHeader(),
            onRefresh: () async {
              Log.d("onrefresh");
              getDatas();
            },
          ),
          loading: loading,
          tag: "GirlPage",
        ));
  }

  void getDatas() {
    NetWorkHandler.getGank_Girl_Random_list().then((value) {
      var decode = json.decode(value);

      GirlRandomResponse girlRandomResponse =
          GirlRandomResponse.fromJson(decode);

      datas.clear();

      datas.addAll(girlRandomResponse.data);

      setState(() {
        loading = false;
      });
    }, onError: (e) {
      Log.d("onError0 " + e.toString());
      setState(() {
        loading = false;
      });
    }).catchError((e) {
      Log.d("onError1 " + e.toString());
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
