//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 03-12-2021 23:57:39
// @ Modified time: 10-02-2022 00:44:41
//

import 'dart:io';

import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/base_bo.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

abstract class AuthBo extends BaseBoImpl {
  late String errorMessage;
  Future<bool> login(String userName, String password);
  Future<void> logout();
}

class AuthBoImpl extends AuthBo {
  final UserDao _userDao = loc<UserDao>();

  @override
  Future<bool> login(String userName, String password) async {
    setState(StateEnum.busy);
    var uName = int.tryParse(userName.substring(0, 1));
    // should not number
    if (uName != null) {
      errorMessage = 'user name should not start with Number';
      setState(StateEnum.idle);
      return false;
    }
    try {
      var success = await _userDao.getAuthUser(userName, password);
      if (!success) {
        errorMessage = 'username or password invalid';
      }
      setState(StateEnum.idle);
      return success;
    } on SocketException catch (e, s) {
      debugPrint("Please Check DB connections $e $s");
      errorMessage = "Please Check DB connections";
      setState(StateEnum.idle);
      return false;
    } catch (e, s) {
      debugPrint(" different exception $e $s");
      errorMessage = "User is not available, please call admin";
      setState(StateEnum.idle);
      return false;
    }
  }

  @override
  Future<void> logout() async {
    setState(StateEnum.busy);
    await _userDao.logout();
    setState(StateEnum.idle);
  }
}
