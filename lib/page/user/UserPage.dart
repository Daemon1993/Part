
import 'package:dpart/page/webview/DWebView.dart';
import 'package:flutter/cupertino.dart';

class UserPage extends StatelessWidget{

  final String url;

  final String title;


  UserPage({@required this.url,@required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return DWebView(url: url,title: title,);
  }


}