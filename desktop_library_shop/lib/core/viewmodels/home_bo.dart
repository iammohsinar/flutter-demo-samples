import 'dart:async';

abstract class HomeBo {
  //StreamController<int> totalBookCount = StreamController<int>();
  StreamController<int> totalNewBookCount = StreamController<int>();
//  Future<int> getTotalBookCount();
  Future<int> saveTest();
  Future<int> getTotalNewBookTest();
}

class HomeBoImpl extends HomeBo {
  // @override
  // Future<int> getTotalBookCount() {

  // }

  Future<int> saveTest() {
    totalNewBookCount.add(DateTime.now().millisecond);
    return Future.delayed(Duration(seconds: 3), () => DateTime.now().second);
  }

  Future<int> getTotalNewBookTest() {
    return Future.delayed(Duration(seconds: 3), () => 18);
  }
}
