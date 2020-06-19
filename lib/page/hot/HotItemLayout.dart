import 'package:dpart/network/response/GankHotResponse.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/widget/base_widget/Gaps.dart';
import 'package:flutter/material.dart';

class HotItemLayout extends StatelessWidget {
  final Data data;

  HotItemLayout({Key key,@required this.data}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Card(
        color: Colors.white,
        child: Container(
          height: 150,
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text(data.desc,maxLines: 2,overflow: TextOverflow.ellipsis),
                      ),
                      flex: 1,
                    ),
                    Gaps.hGap5,
                    data.images.length!=0? Image.network(
                      data.images[0],
                      width: 80,
                      height: 100,
                    ):Gaps.empty,

                  ],
                ),
                Gaps.vGap5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(data.author + '-' + data.category),
                    Text(data.createdAt)
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
