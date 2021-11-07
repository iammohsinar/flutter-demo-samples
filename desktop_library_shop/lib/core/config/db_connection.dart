import 'dart:async';

import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/book_borrowed.dart';
import 'package:desktop_library_shop/core/models/category.dart';
import 'package:desktop_library_shop/core/models/student.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:mysql1/mysql1.dart';

// void main() async {
//   try {
//     print('object');
//     var con = await Db.connection;
//     Results result = await con.query(
//         'select u.* from users u where userName = ? and password = ? and isActive = 1',
//         ['mohsin', '123456']);
//     print(result);
//     //Student u = await DbConnection().getStudentById(1);
//     //print(u.name);
//   } catch (e) {
//     print('caught $e');
//   }
// }

class Db {
  static Future<MySqlConnection> connection = _getConnection();

  static Future<MySqlConnection> _getConnection() async {
    print('---------get db connection');
    var conn = await MySqlConnection.connect(ConnectionSettings(
        //host: '192.168.0.121',
        //host: '192.168.31.201',
        host: 'localhost',
        port: 3306,
        user: 'flutter_user',
        db: 'flutter_library_shop_demo',
        password: 'rootroot'));
    print('---------got db connection');
    return conn;
  }
}

// class DbConnection {
//   //DbConnection._();
//   static final Future<MySqlConnection> connection = _getConnection();

//   static Future<MySqlConnection> _getConnection() async {
//     var conn = await MySqlConnection.connect(ConnectionSettings(
//         //host: '192.168.0.121',
//         host: 'localhost',
//         port: 3306,
//         user: 'flutter_user',
//         db: 'flutter_library_shop_demo',
//         password: 'rootroot'));
//     return conn;
//   }

// -----------------------------------------User-------------------------------------------
  // Future<User> getUserData(String userName, String password) async {
  //   try {
  //     var con = await connection;
  //     Results result = await con.query(
  //         'select u.* from users u where userName = ? and password = ? and isActive = 1',
  //         [userName, password]);
  //     return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
  //   } catch (e) {
  //     //return User.initial();
  //     throw Exception('No record found $e');
  //   }
  // }

  // Future<User> getUserById(String userName, String password) async {
  //   // try {
  //   //   var con = await connection;
  //   //   Results result = await con.query(
  //   //       'select u.* from users u where userName = ? and password = ? and isActive = 1',
  //   //       [userName, password]);
  //   //   return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
  //   // } catch (e) {
  //   //   //return User.initial();
  //   //   throw Exception('No record found $e');
  //   // }
  // }

// -----------------------------------------User-------------------------------------------

// -----------------------------------------Student-------------------------------------------

// -----------------------------------------Student-------------------------------------------

// -----------------------------------------Category-------------------------------------------

// -----------------------------------------Category-------------------------------------------

// -----------------------------------------book-------------------------------------------

// -----------------------------------------book-------------------------------------------
//} // end of class 

