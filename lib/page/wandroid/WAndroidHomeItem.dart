import 'package:dpart/network/response/WAndroidHomeResponse.dart';
import 'package:dpart/widget/base_widget/Gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WAndroidHomeItem extends StatelessWidget {
  final Datas data;

  WAndroidHomeItem({this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  data.title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gaps.vGap24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(data.niceDate.toString()),
                  Text(data.chapterName)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
