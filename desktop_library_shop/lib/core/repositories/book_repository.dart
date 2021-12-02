import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/book_borrowed.dart';
import 'package:mysql1/mysql1.dart';

class BookRepository {
  Future<Book> save(Book b) async {
    try {
      var con = await Db.connection;
      Results r = await con.query(
          'INSERT INTO books (bookId, code, title, author, publisher, cost,categoryId, isActive, stockKeeper, stockOn, isIssue, condition) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
          [
            b.code,
            b.title,
            b.author,
            b.publisher,
            b.cost,
            b.categoryId,
            b.isActive,
            b.stockKeeper,
            b.stockOn,
            b.isIssue,
            b.condition
          ]);
      return await getBookById(r.insertId!);
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<Book> getBookById(int id) async {
    try {
      var con = await Db.connection;
      Results result = await con
          .query('select b.* from books b where b.bookId = ? and b.isActive = 1', [id]);
      return result.isNotEmpty ? Book.fromResult(result.first) : Book.initial();
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

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

  Future<List<Book>> getAll() async {
    try {
      var con = await Db.connection;
      Results results = await con.query('select b.* from books b where b.isActive = 1');
      var books = <Book>[];
      for (var r in results) {
        books.add(Book.fromResult(r));
      }
      return books;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<List<Book>> getAllActiveIssuedBooks() async {
    try {
      var con = await Db.connection;
      Results results = await con.query(
          'select b.* from books b inner join books_borrowed bb on b.bookId = bb.bookId where bb.returnOn is null and b.isActive = 1');
      var books = <Book>[];
      for (var r in results) {
        books.add(Book.fromResult(r));
      }
      return books;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<List<Book>> getAllBooksIssuedSoFar() async {
    try {
      var con = await Db.connection;
      Results results = await con.query(
          'select b.* from books b inner join books_borrowed bb on b.bookId = bb.bookId where and b.isActive = 1');
      var books = <Book>[];
      for (var r in results) {
        books.add(Book.fromResult(r));
      }
      return books;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<List<Book>> getAllBooksIssuedToday() async {
    try {
      var con = await Db.connection;
      Results results = await con.query(
          'select b.* from books b inner join books_borrowed bb on b.bookId = bb.bookId where Date(bb.borrowOn) = ? and b.isActive = 1',
          [DateTime.now()]);
      var books = <Book>[];
      for (var r in results) {
        books.add(Book.fromResult(r));
      }
      return books;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<List<Book>> getAllBooksReturnedToday() async {
    try {
      var con = await Db.connection;
      Results results = await con.query(
          'select b.* from books b inner join books_borrowed bb on b.bookId = bb.bookId where Date(bb.returnOn) = ? and b.isActive = 1',
          [DateTime.now()]);
      var books = <Book>[];
      for (var r in results) {
        books.add(Book.fromResult(r));
      }
      return books;
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }
}
