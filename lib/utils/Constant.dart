
import 'package:flutter/foundation.dart';

class Constant{

  static String getHahaKey(String key){
    return key.substring(0,key.length-1);
  }

  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = kReleaseMode;

  static const String backImage='assets/images/ic_back_black.png';
}