//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 02-11-2021 22:45:34
// @ Modified time: 10-02-2022 00:45:15
//

import 'dart:io';

import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class UserRepository {
  Future<User> getUserData(String userName, String password) async {
    var con = await Db.connection;

    Results result = await con.query(
        'select u.* from users u where userName = ? and password = ? and isActive = 1',
        [userName, password]);
    return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
  }

  Future<User> getUserById(int id) async {
    var con = await Db.connection;

    Results result =
        await con.query('select u.* from users u where u.userId = ? and isActive = 1', [id]);
    return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
  }
}
