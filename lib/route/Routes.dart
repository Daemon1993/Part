

import 'package:dpart/route/route_handles.dart';
import 'package:fluro/fluro.dart';

class Routes{
  static String page_login="/";
  static String page_home="/home";


  static void configRoutes(Router router){
    router.define(page_home, handler: homeHandler);
    router.define(page_login, handler: loginHandler);
    router.notFoundHandler=emptyHandler;
  }
}