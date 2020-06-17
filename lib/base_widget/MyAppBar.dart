import 'package:dpart/base_widget/Gaps.dart';
import 'package:dpart/route/Application.dart';
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

  BuildContext pageContext;

  TabBar bottom;

  MyAppBar({
    Key key,
    this.isBack = true,
    this.rightAction,
    this.title = '',
    this.right_text = '',
    this.rightIcon = '',
    this.pageContext,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AppBar(
      bottom: bottom,
      leading: isBack
          ? IconButton(
              onPressed: () {
                if(pageContext!=null) {
                  Application.router.pop(pageContext);
                }
              },
              icon: Icon(Icons.arrow_back),
            )
          : null,
      automaticallyImplyLeading: false,
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}
