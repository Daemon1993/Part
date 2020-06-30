import 'file:///G:/flutter/github/part/lib/page/login/LoginPage.dart';
import 'package:dpart/page/provider/AppInfoProvider.dart';
import 'package:dpart/page/provider/Counter.dart';
import 'package:dpart/route/Application.dart';
import 'package:dpart/route/Routes.dart';
import 'package:dpart/utils/Log.dart';
import 'package:dpart/utils/ThemeUtils.dart';
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'network/NetWorkHandler.dart';

void main() {
  Router router = Router();
  Routes.configRoutes(router);
  Application.router = router;

  NetWorkHandler.init();


  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_)=>Counter()),
      ChangeNotifierProvider.value(value: AppInfoProvider())
    ],
    child: Consumer<AppInfoProvider>(builder: (context,appinfo,_){
      Color _themeColor;
      var colorKey = appinfo.themeColor;
      if (ThemeUtils.themeColorMap[colorKey] != null) {
          _themeColor = ThemeUtils.themeColorMap[colorKey];
      }
//      Log.d('----------------'+_themeColor.toString()+"  "+colorKey);

      return MyApp(themeColor: _themeColor,);
    }),
  ));
}

class MyApp extends StatelessWidget {
    Color themeColor;


  MyApp({this.themeColor});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: themeColor,
      ),
      title: 'App',
      onGenerateRoute: Application.router.generator,
    );
  }
}
