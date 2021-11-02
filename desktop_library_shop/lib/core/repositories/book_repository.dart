import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/book_borrowed.dart';
import 'package:mysql1/mysql1.dart';

class BookRepository {
  Future<Book> getBookByCategory(int id) async {
    try {
      var con = await Db.connection;
      Results result = await con
          .query('select b.* from books b where b.categoryId = ? and b.isActive = 1', [id]);
      return result.isNotEmpty ? Book.fromResult(result.first) : Book.initial();
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<Book> getBookByCode(String code) async {
    try {
      var con = await Db.connection;
      Results result = await con
          .query('select b.* from books b where b.code = ? and b.isActive = 1', [code]);
      return result.isNotEmpty ? Book.fromResult(result.first) : Book.initial();
    } catch (e) {
      throw Exception('Book not found: $e');
    }
  }

  Future<List<BookBorrowed>> getBooksBorrowedByStudent(int id) async {
    try {
      var con = await Db.connection;
      Results results =
          await con.query('select bb.* from books_borrowed bb where bb.borrower = ?', [id]);
      var books = <BookBorrowed>[];
      for (var row in results) {
        books.add(BookBorrowed.fromResult(row));
      }
      return books;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }
}
