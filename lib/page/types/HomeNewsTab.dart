


import 'dart:convert';


import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/network/NewListBean.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/widget/base_widget/LoadingBaseLayout.dart';
import 'package:dpart/widget/item_widget/NewListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class HomeNewsTab extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeNewsTabState();
  }
}

class _HomeNewsTabState extends State<HomeNewsTab> with AutomaticKeepAliveClientMixin {
  List<Contentlist> datas = new List<Contentlist>();

  EasyRefreshController _controller = EasyRefreshController();
  bool _loading=true;

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
    super.build(context);

    // TODO: implement build

    return
      LoadingBaseLayout(
        loading: _loading,
        child_widget: EasyRefresh(
          child:  ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Contentlist data = datas[index];

              return InkWell(
                child: NewListWidget(data: data),
                onTap: () {
                  Log.d("click item");
                },
              );
            },
            itemCount: datas.length,
          ),
          controller: _controller,

          header: ClassicalHeader(),
          footer: ClassicalFooter(),

          onRefresh: () async{
            Log.d("onrefresh");
            getDatas(true);
          },
          onLoad: () async{
            Log.d("onLoad");
            getDatas(false);
          },
          enableControlFinishRefresh: false,
          enableControlFinishLoad: true,
        ) ,
      );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void getDatas(bool isfresh) {

    Log.d('refresh');

    NetWorkHandler.getNewLists("新冠病毒").then((value) {
      var decode = json.decode(value);
      NewListsBean newListsBean = new NewListsBean.fromJson(decode);
       if(isfresh){
        datas.clear();
      }


      setState(() {
        _loading=false;
          datas.addAll(newListsBean.showapiResBody.pagebean.contentlist);
      });

      if(!isfresh) {
        _controller.finishLoad(success: true, noMore: true);
      }

    });

  }
}
