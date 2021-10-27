import 'dart:async';

import 'package:desktop_library_shop/core/models/user.dart';
import 'package:mysql1/mysql1.dart';

void main() async {
  try {
    User u = await DbConnection().getUserData('mohsin', '123456');
    print(u == User.initial());
  } catch (e) {
    print('caught $e');
  }
}

class DbConnection {
  //DbConnection._();
  static final Future<MySqlConnection> connection = _getConnection();

  static Future<MySqlConnection> _getConnection() async {
    var conn = await MySqlConnection.connect(ConnectionSettings(
        //host: '192.168.0.121',
        host: 'localhost',
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
  Future<User> getUserData(String userName, String password) async {
    try {
      var con = await connection;
      Results result = await con.query(
          'select u.* from users u where userName = ? and password = ? and isActive = 1',
          [userName, password]);
      return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
    } catch (e) {
      //return User.initial();
      throw Exception('No record found $e');
    }
  }
}
