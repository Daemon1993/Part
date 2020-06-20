
import 'dart:convert';

import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/network/response/WAndroidHomeResponse.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/widget/base_widget/LoadingBaseLayout.dart';
import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'WAndroidHomeItem.dart';

class WAndroidHomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WAndroidHomePage();
  }

}

class _WAndroidHomePage extends State<WAndroidHomePage> with AutomaticKeepAliveClientMixin{
  bool loading=true;

  List<Datas> datas=new List<Datas>();

  EasyRefreshController _controller=new EasyRefreshController();

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
    Log.d("_WAndroidHomePage initState");
    getDatas();


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    Log.d("_WAndroidHomePage build");

    return Scaffold(
      appBar: const MyAppBar(
        title: Text("WAndroid"),
        isBack: false,
      ),
      body: LoadingBaseLayout(
        child_widget:EasyRefresh(
          child: ListView.builder(itemBuilder: (context,index){
            Datas data = datas[index];
            return WAndroidHomeItem(data: data,);
          },
            itemCount: datas.length,
          ),

          header: ClassicalHeader(),
          controller: _controller,
          onRefresh: () async{
            getDatas();
          },
          enableControlFinishRefresh: false,
        ) ,
        loading:loading,
        tag:'_WAndroidHomePage',
      ),
    );

  }

  void getDatas() {

    NetWorkHandler.getWandroidList(0).then((value){

      var decode = json.decode(value);
      WAndroidHomeResponse wAndroidHomeResponse = WAndroidHomeResponse.fromJson(decode);

      datas.clear();

      datas.addAll(wAndroidHomeResponse.data.datas);

      setState(() {
        loading=false;
      });

    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}