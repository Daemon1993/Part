
import 'package:dio/dio.dart';
import 'package:dpart/utils/Constant.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flustars/flustars.dart';
import 'package:sprintf/sprintf.dart';



class NwtWorkHandler{

  static final String _appid="269723";
  static final String _appsign="232ad068849f413db469b16c975491495";
  static  String new_list_url="https://route.showapi.com/109-35?maxResult=20&&page=1&showapi_appid=%s&showapi_timestamp=%s&title=%s&showapi_sign=%s";

  static Future<String> getNewLists(String key) async{
    var formatDate = DateUtil.formatDate(DateTime.now(), format: "yyyyMdHHmmss");
    Log.d('getNewLists '+formatDate);
    var url = sprintf(new_list_url,[_appid,formatDate,key,Constant.getHahaKey(_appsign)]);

    Response response = await Dio().get(url);

    return response.toString();

  }

}