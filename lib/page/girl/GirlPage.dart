
import 'dart:convert';

import 'package:dpart/network/NetWorkHandler.dart';
import 'package:dpart/page/girl/GirlRandomResponse.dart';
import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:flutter/material.dart';

class GirlPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GirlPage();
  }
}

class _GirlPage extends State<GirlPage>{
  List<Data> datas=new List<Data>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatas();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        title: Text('福利'),
      ),
      body: GridView.builder(gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5),
          itemBuilder: (context,index){


            return Container(
              height: 80,
              child: Image.network(datas[index].url),
            );
          },
        itemCount: datas.length,
      ),
    );
  }

  void getDatas() {

     NetWorkHandler.getGank_Girl_Random_list().then((value) {

       var decode = json.decode(value);

       GirlRandomResponse girlRandomResponse = GirlRandomResponse.fromJson(decode);

       datas.clear();

       datas.addAll(girlRandomResponse.data);

       setState(() {

       });

     });

  }

}