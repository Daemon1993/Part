import 'package:dpart/page/login/CounterLayout.dart';
import 'package:dpart/page/provider/AppInfoProvider.dart';
import 'package:dpart/page/provider/Counter.dart';
import 'package:dpart/route/Application.dart';
import 'package:dpart/route/Routes.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/widget/base_widget/Gaps.dart';
import 'package:dpart/widget/base_widget/MyAppBar.dart';
import 'package:dpart/widget/base_widget/MyButton.dart';
import 'package:dpart/widget/base_widget/MyInputText.dart';
import 'package:dpart/widget/item_widget/DialogThemeChooseLayout.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void getHttp(BuildContext context) async {
  try {
    Response response = await Dio().get("http://www.baidu.com");
    print(response);

    Routes.navigateTo(context, Routes.page_home, params: {'name': 'Daemon'});
  } catch (e) {
    print(e);
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Log.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            isBack: false,
            title: Text('账号登录'),
            right_text: '',
            rightAction: () => {Log.d("right Action")}),
        body: Center(
          child: Column(
            children: <Widget>[
              CounterLayout(),

              Gaps.vGap50,
              MyInputText(
                controller: _nameController,
                labelText: '账号',
                hintText: '请输入账号',
                prefixIcon: Icon(Icons.person),
              ),
              MyInputText(
                controller: _pwdController,
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock),
              ),
              Gaps.vGap24,
              Consumer(
                builder: (context, Counter counter, child) => MyButton(
                  action: () {
                    counter.increment();
                    getHttp(context);
                  },
                  width: 200,
                  name: '登录',
                ),
              )
            ],
          ),
        ));
  }
}
