//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 03-12-2021 23:57:39
// @ Modified time: 10-02-2022 00:45:26
//

import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/book.dart';
import 'package:desktop_library_shop/core/models/book_borrowed.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class BookRepository {
  Future<Book> save(Book b) async {
    var con = await Db.connection;

    Results r = await con.query(
        'INSERT INTO books (publishYear,code, title, author, publisher, cost,categoryId, isActive, stockKeeper, stockOn, isIssue, `condition`) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)',
        [
          b.publishYear,
          b.code,
          b.title,
          b.author,
          b.publisher,
          b.cost,
          b.categoryId,
          b.isActive,
          b.stockKeeper,
          b.stockOn.toUtc(),
          b.isIssue,
          b.condition,
        ]);
    return await getBookById(r.insertId!);
  }

  Future<List<Book>> getBooksByQuery(String whereQuery) async {
    var con = await Db.connection;

    Results results = await con.query('select b.* from books b where $whereQuery');
    print(results.length);
    var books = <Book>[];
    for (var r in results) {
      books.add(Book.fromResult(r));
    }
    return books;
  }

  Future<Book> getBookById(int id) async {
    var con = await Db.connection;

    Results result =
        await con.query('select b.* from books b where b.bookId = ? and b.isActive = 1', [id]);

    return result.isNotEmpty ? Book.fromResult(result.first) : Book.initial();
  }

  Future<Book> getBookByCategory(int id) async {
    var con = await Db.connection;

    Results result = await con
        .query('select b.* from books b where b.categoryId = ? and b.isActive = 1', [id]);
    return result.isNotEmpty ? Book.fromResult(result.first) : Book.initial();
  }

  Future<Book> getBookByCode(String code) async {
    var con = await Db.connection;

    Results result =
        await con.query('select b.* from books b where b.code = ? and b.isActive = 1', [code]);
    return result.isNotEmpty ? Book.fromResult(result.first) : Book.initial();
  }

  Future<List<BookBorrowed>> getBooksBorrowedByStudent(int id) async {
    var con = await Db.connection;

    Results results =
        await con.query('select bb.* from books_borrowed bb where bb.borrower = ?', [id]);
    var books = <BookBorrowed>[];
    for (var row in results) {
      books.add(BookBorrowed.fromResult(row));
    }
    return books;
  }

  Future<List<Book>> getAll() async {
    var con = await Db.connection;

    Results results = await con.query('select b.* from books b where b.isActive = 1');
    var books = <Book>[];
    for (var r in results) {
      books.add(Book.fromResult(r));
    }
    return books;
  }

  Future<List<Book>> getAllActiveIssuedBooks() async {
    var con = await Db.connection;

    Results results = await con.query(
        'select b.* from books b inner join books_borrowed bb on b.bookId = bb.bookId where bb.returnOn is null and b.isActive = 1');
    var books = <Book>[];
    for (var r in results) {
      books.add(Book.fromResult(r));
    }
    return books;
  }

  Future<List<Book>> getAllBooksIssuedSoFar() async {
    var con = await Db.connection;

    Results results = await con.query(
        'select b.* from books b inner join books_borrowed bb on b.bookId = bb.bookId where and b.isActive = 1');
    var books = <Book>[];
    for (var r in results) {
      books.add(Book.fromResult(r));
    }
    return books;
  }

  Future<List<Book>> getAllBooksIssuedToday() async {
    var con = await Db.connection;

    Results results = await con.query(
        'select b.* from books b inner join books_borrowed bb on b.bookId = bb.bookId where Date(bb.borrowOn) = ? and b.isActive = 1',
        [DateTime.now()]);
    var books = <Book>[];
    for (var r in results) {
      books.add(Book.fromResult(r));
    }
    return books;
  }

  Future<List<Book>> getAllBooksReturnedToday() async {
    var con = await Db.connection;

    Results results = await con.query(
        'select b.* from books b inner join books_borrowed bb on b.bookId = bb.bookId where Date(bb.returnOn) = ? and b.isActive = 1',
        [DateTime.now()]);
    var books = <Book>[];
    for (var r in results) {
      books.add(Book.fromResult(r));
    }
    return books;
  }
}
