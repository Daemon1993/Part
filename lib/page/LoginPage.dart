

import 'package:dpart/route/Application.dart';
import 'package:dpart/route/Routes.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:dpart/base_widget/Gaps.dart';
import 'package:dpart/base_widget/MyAppBar.dart';
import 'package:dpart/base_widget/MyButton.dart';
import 'package:dpart/base_widget/MyInputText.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void getHttp(BuildContext context) async {
  try {
    Response response = await Dio().get("http://www.baidu.com");
    print(response);

    Routes.navigateTo(context, Routes.page_home,params: {'name':'Daemon'});

  } catch (e) {
    print(e);
  }
}


class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
        appBar:MyAppBar(isBack: true,title: '账号登录',right_text: '',
            rightAction: ()=>{
              Log.d("right Action")
            }
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              Gaps.vGap50,
              MyInputText(controller: _nameController,labelText: '账号',hintText: '请输入账号',prefixIcon: Icon(Icons.person),),
              MyInputText(controller: _pwdController,labelText: '密码',hintText: '请输入密码',prefixIcon: Icon(Icons.lock),),
              Gaps.vGap24,
              MyButton(action: (){
                getHttp(context);
              },width: 200,name: '登录',),
            ],
          ),
        )
    );
  }


}