import 'dart:async';

abstract class HomeBo {
  StreamController<int> totalNewBookCount = StreamController<int>();
  Future<int> saveTest();
  Future<int> getTotalNewBookTest();
}

class HomeBoImpl extends HomeBo {
  Future<int> saveTest() {
    totalNewBookCount.add(DateTime.now().millisecond);
    return Future.delayed(Duration(seconds: 3), () => DateTime.now().second);
  }

  Future<int> getTotalNewBookTest() {
    return Future.delayed(Duration(seconds: 3), () => 18);
  }
}
