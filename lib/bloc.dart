import 'dart:async';

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
