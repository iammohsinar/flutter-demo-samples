//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 21-11-2021 22:57:54
// @ Modified time: 10-02-2022 00:44:24
//

import 'dart:async';

abstract class HomeBo {
  StreamController<int> totalNewBookCount = StreamController<int>();
  Future<int> getTotalNewBookTest();
}

class HomeBoImpl extends HomeBo {
  Future<int> getTotalNewBookTest() {
    return Future.delayed(Duration(seconds: 3), () => 18);
  }
}
