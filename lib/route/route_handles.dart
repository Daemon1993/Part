

import 'file:///G:/flutter/github/part/lib/page/PageEmpty.dart';
import 'package:dpart/main.dart';
import 'package:dpart/page/HomePage.dart';
import 'package:dpart/page/LoginPage.dart';
import 'package:fluro/fluro.dart';

var emptyHandler=new Handler(handlerFunc: (context, parameters){
  return PageEmpty();
});

var  loginHandler=new Handler(handlerFunc: (context, parameters) {
    return LoginPage();
});

var  homeHandler=new Handler(handlerFunc: (context, parameters) {
  return HomePage();
});



