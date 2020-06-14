import 'package:flustars/flustars.dart';

import 'Constant.dart';



class Log {

  static const String tag = 'Di-LOG';
  static void init(){
    LogUtil.init(tag: tag,isDebug:!Constant.inProduction);
  }

  static void d(String msg){
    LogUtil.v(msg);
  }

  static void e(String msg){
    LogUtil.e(msg);

  }
}