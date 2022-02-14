//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 19-12-2021 12:57:23
// @ Modified time: 10-02-2022 00:45:57
//

import 'dart:async';
import 'package:mysql1/mysql1.dart';

class Db {
  static Future<MySqlConnection> connection = _getConnection();
  static Future<MySqlConnection> _getConnection() async {
    var conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'flutter_user',
        db: 'flutter_library_shop_demo',
        password: 'rootroot'));
    return conn;
  }
}
