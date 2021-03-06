


import 'package:dpart/main.dart';
import 'package:dpart/page/HomePage.dart';
import 'file:///G:/flutter/github/part/lib/page/login/LoginPage.dart';
import 'package:dpart/page/PageEmpty.dart';
import 'package:dpart/page/user/UserPage.dart';
import 'package:dpart/utils/Log.dart';
import 'package:fluro/fluro.dart';

var emptyHandler=new Handler(handlerFunc: (context, parameters){
  return PageEmpty();
});

var  loginHandler=new Handler(handlerFunc: (context, parameters) {
    return LoginPage();
});

var  webviewHandler=new Handler(handlerFunc: (context, parameters) {

  final String url = parameters['url']?.first;
  final String title = parameters['title']?.first;

  return UserPage(url:url,title:title);
});

var  homeHandler=new Handler(handlerFunc: (context, parameters) {
  final String name = parameters['name']?.first;
  Log.d('name '+name);
  return HomePage(name: name,);
});



