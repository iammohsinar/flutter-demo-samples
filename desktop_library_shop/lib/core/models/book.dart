//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 03-12-2021 23:57:39
// @ Modified time: 10-02-2022 00:45:43
//

import 'package:equatable/equatable.dart';
import 'package:mysql1/src/results/row.dart';

class Book extends Equatable {
  Book(
      {this.bookId = 0,
      required this.code,
      required this.title,
      required this.author,
      required this.publisher,
      required this.publishYear,
      required this.cost,
      required this.categoryId,
      this.isActive = 1,
      required this.stockKeeper,
      required this.stockOn,
      this.isIssue = 0,
      this.condition = 'new',
      this.retire,
      this.totalCopies = 10,
      this.language = 'English'});

  late final int bookId;
  late final String code;
  late final String title;
  late final String author;
  late final String publisher;
  late final int publishYear;
  late final int cost;
  late final int categoryId;
  late final int isActive;
  late final int stockKeeper;
  late final DateTime stockOn;
  late final int isIssue;
  late final String condition;
  late final String? retire;
  late final int totalCopies;
  late final String language;

  Book.initial()
      : bookId = 0,
        code = '',
        title = '',
        author = '',
        publisher = '',
        publishYear = 0,
        cost = 0,
        categoryId = 0,
        isActive = 1,
        stockKeeper = 0,
        stockOn = DateTime.utc(DateTime.now().year),
        isIssue = 0,
        condition = '',
        retire = '',
        totalCopies = 0,
        language = '';

  Book.fromResult(ResultRow r) {
    bookId = r['bookId'];
    code = r['code'];
    title = r['title'];
    author = r['author'];
    publisher = r['publisher'];
    publishYear = r['publishYear'];
    cost = r['cost'];
    categoryId = r['categoryId'];
    isActive = r['isActive'];
    stockKeeper = r['stockKeeper'];
    stockOn = r['stockOn'];
    isIssue = r['isIssue'];
    condition = r['condition'];
    retire = r['retire'] ?? '';
    totalCopies = 10;
    language = 'English';
  }

  @override
  List<Object?> get props => [
        bookId,
        code,
        title,
        author,
        publisher,
        publishYear,
        cost,
        categoryId,
        isActive,
        stockKeeper,
        stockOn,
        isIssue,
        condition,
        retire,
        totalCopies,
        language
      ];
}
