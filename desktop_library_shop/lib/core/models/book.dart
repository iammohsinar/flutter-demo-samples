import 'package:desktop_library_shop/core/models/student.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:mysql1/src/results/row.dart';

class Book extends Equatable {
  Book({
    required this.bookId,
    required this.code,
    required this.title,
    required this.author,
    required this.publisher,
    required this.cost,
    required this.categoryId,
    required this.isActive,
    required this.stockKeeper,
    required this.stockOn,
    required this.isIssue,
  });
  late final int bookId;
  late final String code;
  late final String title;
  late final String author;
  late final String publisher;
  late final int cost;
  late final int categoryId;
  late final int isActive;
  late final int stockKeeper;
  late final DateTime stockOn;
  late final int isIssue;
  late final String condition;
  late final String retire;

  Book.initial()
      : bookId = 0,
        code = '',
        title = '',
        author = '',
        publisher = '',
        cost = 0,
        categoryId = 0,
        isActive = 0,
        stockKeeper = 0,
        stockOn = DateTime.now(),
        isIssue = 0,
        condition = '',
        retire = '';

  Book.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    code = json['code'];
    title = json['title'];
    author = json['author'];
    publisher = json['publisher'];
    cost = json['cost'];
    categoryId = json['categoryId'];
    isActive = json['isActive'];
    stockKeeper = json['stockKeeper'];
    stockOn = json['stockOn'];
    isIssue = json['isIssue'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bookId'] = bookId;
    _data['title'] = title;
    _data['author'] = author;
    _data['publisher'] = publisher;
    _data['cost'] = cost;
    _data['categoryId'] = categoryId;
    _data['isActive'] = isActive;
    _data['stockKeeper'] = stockKeeper;
    _data['stockOn'] = stockOn;
    _data['isIssue'] = isIssue;
    return _data;
  }

  Book.fromResult(ResultRow r) {
    bookId = r['bookId'];
    code = r['code'];
    title = r['title'];
    author = r['author'];
    publisher = r['publisher'];
    cost = r['cost'];
    categoryId = r['categoryId'];
    isActive = r['isActive'];
    stockKeeper = r['stockKeeper'];
    stockOn = r['stockOn'];
    isIssue = r['isIssue'];
    condition = r['condition'];
    retire = r['retire'] ?? '';
  }

  @override
  List<Object?> get props => [
        bookId,
        code,
        title,
        author,
        publisher,
        cost,
        categoryId,
        isActive,
        stockKeeper,
        stockOn,
        isIssue,
        condition,
        retire,
      ];
}
