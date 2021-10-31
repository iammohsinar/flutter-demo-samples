import 'dart:async';

import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/category.dart';
import 'package:desktop_library_shop/core/models/student.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:mysql1/mysql1.dart';

void main() async {
  try {
    List<Book> u = await DbConnection().getAllBorrowedBooks();
    print(u.length);
    print(u.first.author);
    print(u.first.borrower.name);
    print(u.first.issuer.userName);
    print(u.first.stockKeeper.userName);
    print(u.first.returnOn);
    //print(u == User.initial());
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

// -----------------------------------------User-------------------------------------------
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
// -----------------------------------------User-------------------------------------------

// -----------------------------------------Student-------------------------------------------

  Future<Student> getStudentData(String stdRollNumber) async {
    try {
      var con = await connection;
      Results result = await con.query(
          "select std.* from students std where std.enrolledCardNumber = ? and std.isActive = 1 ",
          [stdRollNumber]);
      return result.isNotEmpty ? Student.fromResult(result.first) : Student.initial();
    } catch (e) {
      throw Exception('No record found $e');
    }
  }

// -----------------------------------------Student-------------------------------------------

// -----------------------------------------Category-------------------------------------------

  Future<List<Category>> getAllCategories() async {
    try {
      var con = await connection;
      Results results =
          await con.query('select cat.* from categories cat where cat.isActive = 1');
      var categories = <Category>[];
      for (var r in results) {
        categories.add(Category.fromResult(r));
      }
      return categories;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

// -----------------------------------------Category-------------------------------------------

// -----------------------------------------book-------------------------------------------
  Future<Book> getBookByCategory(int categoryId) async {
    try {
      var con = await connection;
      Results result = await con.query(
          'select b.* from books b where b.categoryId = ? and b.isActive = 1', [categoryId]);
      return result.isNotEmpty ? Book.fromResult(result.first) : Book.initial();
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<List<Book>> getAllBorrowedBooks() async {
    try {
      var con = await connection;
      // Results results = await con
      //     .query('select b.* from books b where b.borrower is not null and b.isActive = 1');
      Results results = await con.query(
          'select b.*, std.*, iu.*, su.* from books b inner join students std on b.borrower = std.studentId inner join users iu on b.issuer = iu.userId inner join users su on b.stockKeeper = su.userId where b.isActive = 1 and b.borrower is not null');
      var books = <Book>[];
      for (var row in results) {
        //row.
        print(row);
        books.add(Book.fromResult(row));
      }
      return books;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

// -----------------------------------------book-------------------------------------------
} // end of class 

