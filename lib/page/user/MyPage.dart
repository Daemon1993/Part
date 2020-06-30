import 'package:dpart/main.dart';
import 'package:dpart/route/Routes.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:dpart/widget/item_widget/Base_item_right_layout.dart';
import 'package:dpart/widget/item_widget/DialogThemeChooseLayout.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('我的'),
        isBack: false,
      ),
      body: Column(
        children: <Widget>[
          Base_item_right_layout(
            name: '点个Star',
            action: () {
              Log.d("-----do");
              _launchUrl('https://github.com/Daemon1993/Part');
            },
          ),
          Base_item_right_layout(
            name: '关于',
            action: () {
              Routes.navigateTo(context, Routes.page_webview, params: {'url': 'https://github.com/Daemon1993','title':'Daemon'});
            },
          ),
          Base_item_right_layout(
            name: '主题颜色',
            action: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: DialogThemeChooseLayout(),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}

_launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}
