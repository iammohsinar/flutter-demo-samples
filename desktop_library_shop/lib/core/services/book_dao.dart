import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/book_borrowed.dart';
import 'package:desktop_library_shop/core/repositories/book_repository.dart';
import 'package:desktop_library_shop/locator.dart';

abstract class BookDao {
  Future<Book> getByCategory(int id);
  Future<Book> getByCode(String code);
  Future<List<BookBorrowed>> getBooksBorrowed(int id);
}

class BookDaoImpl extends BookDao {
  final BookRepository _bookRepository = loc<BookRepository>();
  @override
  Future<List<BookBorrowed>> getBooksBorrowed(int id) async {
    try {
      return await _bookRepository.getBooksBorrowedByStudent(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Book> getByCategory(int id) async {
    try {
      return await _bookRepository.getBookByCategory(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Book> getByCode(String code) async {
    try {
      return await _bookRepository.getBookByCode(code);
    } catch (e) {
      rethrow;
    }
  }
}
