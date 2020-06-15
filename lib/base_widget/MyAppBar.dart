import 'package:dpart/base_widget/Gaps.dart';
import 'package:dpart/utils/Constant.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';

/**
 * 自定义AppBar 控制左右中间显示
 */
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool isBack;
  VoidCallback rightAction;

  String title;
  String right_text;
  String rightIcon;

  MyAppBar({
    Key key,
    this.isBack = true,
    this.rightAction,
    this.title = '',
    this.right_text = '',
    this.rightIcon = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AppBar(
      leading: isBack
          ? IconButton(
              onPressed: () {},
              icon: Image.asset(Constant.backImage,width: 30,height: 30,),

            )
          : null,
      title: Text(this.title),
      actions: <Widget>[
        FlatButton(
          child: Text(
            this.right_text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: this.rightAction==null?this.rightAction:null,
        ),
        this.rightIcon.isNotEmpty
            ? IconButton(
                icon: Image.asset(rightIcon),
              )
            : Gaps.empty
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
