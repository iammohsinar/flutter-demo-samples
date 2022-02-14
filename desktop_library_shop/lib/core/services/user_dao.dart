//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 03-12-2021 23:57:39
// @ Modified time: 10-02-2022 00:44:52
//

import 'dart:async';

import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/core/repositories/user_repository.dart';
import 'package:desktop_library_shop/locator.dart';

class UserDaoImpl extends UserDao {
  final UserRepository _userRepository = loc<UserRepository>();

  @override
  Future<List<User>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<bool> getAuthUser(String userName, String password) async {
    var fetchedUser = await _userRepository.getUserData(userName, password);
    var isAuthenticated = fetchedUser != User.initial();
    if (isAuthenticated) {
      // add user for global stream
      userController.add(fetchedUser);
    }
    return isAuthenticated;
  }

  @override
  Future<User> getOne(int id) async {
    return await _userRepository.getUserById(id);
  }

  @override
  Future<bool> logout() async {
    userController.done;
    return true;
  }
}

abstract class UserDao {
  StreamController<User> userController = StreamController<User>();
  Future<User> getOne(int id);
  Future<List<User>> getAll();
  Future<bool> getAuthUser(String userName, String password);
  Future<bool> logout();
}
