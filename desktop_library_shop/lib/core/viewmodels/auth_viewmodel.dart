import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/services/auth_service.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/locator.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  //final AuthService _authService = loc<AuthService>();
  final UserDao _userDao = loc<UserDao>();
  StateEnum _state = StateEnum.idle;
  StateEnum get state => _state;

  late String errorMessage;

  Future<bool> login(String userName, String password) async {
    _state = StateEnum.busy;
    notifyListeners();

    var uName = int.tryParse(userName.characters.elementAt(0));
    // should not number
    if (uName != null) {
      errorMessage = 'user name should not start with Number';
      _state = StateEnum.idle;
      notifyListeners();
      return false;
    }

    var success = await _userDao.getAuthUser(userName, password);
    _state = StateEnum.idle;
    notifyListeners();
    return success;
  }
}
