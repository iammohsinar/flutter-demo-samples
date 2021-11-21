import 'dart:async';

import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/book_borrowed.dart';
import 'package:desktop_library_shop/core/repositories/book_repository.dart';
import 'package:desktop_library_shop/locator.dart';

abstract class BookDao {
  StreamController<int> totalBooks = StreamController();
  // StreamController<int> totalCopies = StreamController();
  // StreamController<int> totalActiveBooksIssued = StreamController();
  // StreamController<int> totalBooksIssuedSoFar = StreamController();
  // StreamController<int> totalBooksIssuedToday = StreamController();
  // StreamController<int> totalBooksReturnedToday = StreamController();
  // StreamController<int> totalBooksDelayInReturn = StreamController();
  // StreamController<int> totalBooksDueReturn = StreamController();
  // StreamController<int> totalBooksAsNew = StreamController();
  // StreamController<int> totalUseableBooks = StreamController();
  // StreamController<int> totalBooksToDiscard = StreamController();
  // StreamController<int> totalPoorBooks = StreamController();
  // StreamController<int> tatalBooksInSingleRack = StreamController();
  // StreamController<int> totalBooksCapacityInRack = StreamController();
  // StreamController<int> totalStudents = StreamController();
  // StreamController<int> totalStaffs = StreamController();

  Future<Book> getByCategory(int id);
  Future<Book> getByCode(String code);
  Future<List<BookBorrowed>> getBooksBorrowed(int id);

  Future<List<Book>> getAll();
  Future<int> getSampleDataCount();
  Future<List<Book>> getAllActiveIssuedBooks();

  Future<List<Book>> getAllBooksIssuedSoFar();
  Future<List<Book>> getAllBooksIssuedToday();
  Future<List<Book>> getAllBooksReturnedToday();
}

class BookDaoImpl extends BookDao {
  final BookRepository _bookRepository = loc<BookRepository>();

  BookDaoImpl() {
    totalBooks.addStream(Stream.periodic(Duration(seconds: 1), (_) {
      return DateTime.now().millisecond;
    }));
  }

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

  @override
  Future<List<Book>> getAll() async {
    try {
      return await _bookRepository.getAll();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Book>> getAllActiveIssuedBooks() async {
    try {
      return await _bookRepository.getAllActiveIssuedBooks();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Book>> getAllBooksIssuedSoFar() async {
    try {
      return await _bookRepository.getAllBooksIssuedSoFar();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Book>> getAllBooksIssuedToday() async {
    try {
      return await _bookRepository.getAllBooksIssuedToday();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Book>> getAllBooksReturnedToday() async {
    try {
      return await _bookRepository.getAllBooksReturnedToday();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> getSampleDataCount() {
    try {
      return Future<int>.delayed(Duration(seconds: 2), () => DateTime.now().millisecond * 3);
    } catch (e) {
      rethrow;
    }
  }
}
