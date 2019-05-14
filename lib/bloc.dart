import 'dart:async';
import 'package:flutter/material.dart';

class BLoC {
  int _count;
  StreamController<int> _controller;

  BLoC() {
    _count = 0;
    _controller = new StreamController.broadcast();
    print('新建了一个BLoC');
  }

  Stream<int> get streamCount => _controller.stream;

  int get count => _count;

  increment() {
    _controller.sink.add(++_count);
  }

  dispose() {
    _controller.close();
  }
}

class BLoCTheme {
  ThemeData _themeData;
  StreamController<ThemeData> _controller;

  BLoCTheme(){
    _themeData = ThemeData.light();
    _controller = StreamController();
    print('新建了一个BLoCTheme');
  }

  Stream<ThemeData> get streamThemeData => _controller.stream;

  ThemeData get themeData => _themeData;

  changeTheme() {
    print('切换主题了');
    if(_themeData == ThemeData.dark())
      _themeData = ThemeData.light();
    else
      _themeData = ThemeData.dark();

    _controller.sink.add(_themeData);
  }
  dispose(){
    _controller.close();
  }
}
