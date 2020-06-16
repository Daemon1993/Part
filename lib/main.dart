
import 'package:dpart/page/LoginPage.dart';
import 'package:dpart/route/Application.dart';
import 'package:dpart/route/Routes.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter/material.dart';



void main() {


  Router router=Router();
  Routes.configRoutes(router);
  Application.router=router;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'App',
      onGenerateRoute: Application.router.generator,
    );
  }
}

