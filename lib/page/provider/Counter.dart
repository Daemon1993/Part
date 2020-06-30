
import 'package:flutter/widgets.dart';

class Counter with ChangeNotifier{
  int _count=0;

  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

}