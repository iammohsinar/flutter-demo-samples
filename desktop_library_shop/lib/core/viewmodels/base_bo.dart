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
