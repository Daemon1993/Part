

import 'package:dpart/route/Application.dart';
import 'package:dpart/route/route_handles.dart';
import 'package:dpart/utils/Log.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes{
  static String page_login="/";
  static String page_home="/home";
  static String page_iamge_preview="/iamge_preview";
  static String page_webview="/webview";


  static void configRoutes(Router router){
    router.define(page_home, handler: homeHandler);
    router.define(page_login, handler: loginHandler);
    router.define(page_webview, handler: webviewHandler);
    router.notFoundHandler=emptyHandler;
  }

  static Future navigateTo(BuildContext context, String path,{Map<String, dynamic> params,bool replace=false}){
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    Log.d('我是navigateTo传递的参数：$query');

    path = path + query;
    return Application.router.navigateTo(context, path,replace: replace);

  }

}