import 'dart:async';

import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/book_borrowed.dart';
import 'package:desktop_library_shop/core/models/category.dart';
import 'package:desktop_library_shop/core/models/student.dart';
import 'package:desktop_library_shop/core/models/user.dart';
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
