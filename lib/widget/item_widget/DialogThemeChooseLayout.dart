import 'package:dpart/page/provider/AppInfoProvider.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/utils/ThemeUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogThemeChooseLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DialogThemeChooseLayoutState();
  }
}

class _DialogThemeChooseLayoutState extends State<DialogThemeChooseLayout> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<String> keys = ThemeUtils.themeColorMap.keys.toList();

    List<Widget> theme_boxs = new List();
    keys.forEach((element) {
      theme_boxs.add(Consumer(
          builder: (context, AppInfoProvider appinfo, _) => InkWell(
              onTap: () {
//                Log.d("-----" + element);
                appinfo.setTheme(element);
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                color: ThemeUtils.themeColorMap[element],
              ))));
    });

    return Material(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              spacing: 8.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: theme_boxs,
            )));
  }
}
