


import 'package:dio/dio.dart';
import 'package:dpart/utils/Constant.dart';
import 'package:dpart/utils/Log.dart';
import 'package:flustars/flustars.dart';
import 'package:sprintf/sprintf.dart';



class NetWorkHandler{

  static Dio dio = new Dio(); // with default Options
  static init(){

// Set default configs
    dio.options.baseUrl = "https://gank.io/api/v2";
    dio.options.connectTimeout = 10000; //5s
    dio.options.receiveTimeout = 10000;

// or new Dio with a BaseOptions instance.
//    BaseOptions options = new BaseOptions(
//      baseUrl: "https://www.xx.com/api",
//      connectTimeout: 5000,
//      receiveTimeout: 3000,
//    );
//    dio = new Dio(options);
  }

  static final String _appid="269723";
  static final String _appsign="232ad068849f413db469b16c975491495";
  static  String new_list_url="https://route.showapi.com/109-35?maxResult=20&&page=1&showapi_appid=%s&showapi_timestamp=%s&title=%s&showapi_sign=%s";
  static  String weibo_list_url="https://route.showapi.com/254-1?showapi_appid=%s&showapi_timestamp=%s&space=day&typeId=1&showapi_sign=%s";
  static Future<String> getNewLists(String key) async{
    var formatDate = DateUtil.formatDate(DateTime.now(), format: "yyyyMdHHmmss");
    Log.d('getNewLists '+formatDate);
    var url = sprintf(new_list_url,[_appid,formatDate,key,Constant.getHahaKey(_appsign)]);

    Response response = await Dio().get(url);


    return response.toString();

  }

  static Future<String> getWeiboLists() async{
    var formatDate = DateUtil.formatDate(DateTime.now(), format: "yyyyMdHHmmss");
    Log.d('getWeiboLists '+formatDate);
    var url = sprintf(weibo_list_url,[_appid,formatDate,Constant.getHahaKey(_appsign)]);


    Response response = await Dio().get(url);


    return response.toString();

  }



  static final String Gank_GH_Hot_List="/hot/views/category/GanHuo/count/20";
  static final String Gank_Girl_Random_list="/random/category/Girl/type/Girl/count/20";

  static Future<String> getGankHotList() async{

    Response response = await dio.get(Gank_GH_Hot_List);

    return response.toString();
  }

  static Future<String> getGank_Girl_Random_list() async{

    Response response = await dio.get(Gank_Girl_Random_list);

    return response.toString();
  }

}