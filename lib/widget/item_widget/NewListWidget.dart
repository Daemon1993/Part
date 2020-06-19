


import 'package:dpart/network/NewListBean.dart';
import 'package:dpart/widget/base_widget/Gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewListWidget extends StatelessWidget{
  final Contentlist data;
  NewListWidget({@required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    String img = '';
    if (data.imageurls != null && data.imageurls.length != 0) {
      img = data.imageurls[0].url;
    }

    return
      Card(
        child:  Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(data.channelName,style: TextStyle(color: Colors.red),),
              Gaps.vGap8,
              Text(data.title, maxLines: 2,
                overflow: TextOverflow.ellipsis,),
              Gaps.vGap5,
              img.isEmpty
                  ? Gaps.empty
                  : Image.network(
                img,
                width: 200,
              )
            ],
          ),
        ),
      );
  }

}