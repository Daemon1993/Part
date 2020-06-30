
import 'package:dpart/page/provider/Counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      var counter = Provider.of<Counter>(context);
    return Text('login count ${counter.count}');
  }

}