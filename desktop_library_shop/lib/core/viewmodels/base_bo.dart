//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 04-11-2021 01:42:16
// @ Modified time: 10-02-2022 00:44:32
//

import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:flutter/material.dart';

class BaseBoImpl extends ChangeNotifier {
  StateEnum _state = StateEnum.idle;

  StateEnum get state => _state;

  setState(StateEnum state) {
    _state = state;
    notifyListeners();
  }
}
