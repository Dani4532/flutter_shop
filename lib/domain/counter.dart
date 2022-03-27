import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int count = 0;

  tick(){
    count += 1;
    notifyListeners();
  }

  reset(){
    count = 0;
    notifyListeners();
  }

  removeOne(){
    count -= 1;
    notifyListeners();
  }

  removeValue(int value){
    count -= value;
    notifyListeners();
  }

}