import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/services/auth_service.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/base_bo.dart';
//import 'package:desktop_library_shop/core/viewmodels/base_model.dart';
import 'package:desktop_library_shop/locator.dart';
import 'package:flutter/material.dart';

class LoginModel extends BaseBoImpl {
  //final AuthService _authService = loc<AuthService>();
  final UserDao _userDao = loc<UserDao>();
  late String errorMessage;

  Future<bool> login(String userName, String password) async {
    setState(StateEnum.busy);
    var uName = int.tryParse(userName.characters.elementAt(0));
    // should not number
    if (uName != null) {
      errorMessage = 'user name should not start with Number';
      setState(StateEnum.idle);
      return false;
    }
    var success = await _userDao.getAuthUser(userName, password);
    setState(StateEnum.idle);
    return success;
  }
}
