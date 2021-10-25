import 'dart:async';

import 'package:desktop_library_shop/core/models/user.dart';
import 'package:mysql1/mysql1.dart';

void main() {
  DbConnection().login('mohsin', '123456');
}

class DbConnection {
  //DbConnection._();
  static final Future<MySqlConnection> connection = _getConnection();

  static Future<MySqlConnection> _getConnection() async {
    var conn = await MySqlConnection.connect(ConnectionSettings(
        //host: '192.168.0.121',
        host: '127.0.0.1',
        port: 3306,
        user: 'flutter_user',
        db: 'flutter_library_shop_demo',
        password: 'rootroot'));
    return conn;
  }

  // static Future<Results> fetch() async {
  //   var con = await connection;
  //   return await con.query('select * from my_users');
  // }
  Future<Results> login(String userName, String password) async {
    try {
      var con = await connection;
      Results result = await con.query('select u.* from users u');
      // con.query('select u.userName from users u').then((value) => print(value));
      print('--- ${result.fields}');
      //  where u.userName = ? AND u.password = ?',
      // [userName, password]);
      return result; //User.fromResult(result.first);
    } catch (e) {
      throw Exception('No record found $e');
    }
  }
}
