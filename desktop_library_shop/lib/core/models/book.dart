import 'package:desktop_library_shop/core/models/student.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:mysql1/src/results/row.dart';

class Book extends Equatable {
  Book({
    required this.bookId,
    required this.title,
    required this.author,
    required this.publisher,
    required this.cost,
    required this.categoryId,
    required this.borrower,
    required this.issuer,
    required this.issueOn,
    required this.returnOn,
    required this.shouldReturnOn,
    required this.fineAmount,
    required this.isActive,
    required this.stockKeeper,
    required this.stockOn,
    required this.isIssued,
  });
  late final int bookId;
  late final String title;
  late final String author;
  late final String publisher;
  late final int cost;
  late final int categoryId;
  late final Student borrower;
  late final User issuer;
  late final DateTime issueOn;
  late final DateTime returnOn;
  late final DateTime shouldReturnOn;
  late final int fineAmount;
  late final int isActive;
  late final User stockKeeper;
  late final DateTime stockOn;
  late final int isIssued;

  Book.initial()
      : bookId = 0,
        title = '',
        author = '',
        publisher = '',
        cost = 0,
        categoryId = 0,
        borrower = Student.initial(),
        issuer = User.initial(),
        issueOn = DateTime.now(),
        returnOn = DateTime.now(),
        shouldReturnOn = DateTime.now(),
        fineAmount = 0,
        isActive = 0,
        stockKeeper = User.initial(),
        stockOn = DateTime.now(),
        isIssued = 0;

  Book.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    title = json['title'];
    author = json['author'];
    publisher = json['publisher'];
    cost = json['cost'];
    categoryId = json['categoryId'];
    borrower = json['borrower'];
    issuer = json['issuer'];
    issueOn = json['issueOn'];
    returnOn = json['returnOn'];
    shouldReturnOn = json['shouldReturnOn'];
    fineAmount = json['fineAmount'];
    isActive = json['isActive'];
    stockKeeper = json['stockKeeper'];
    stockOn = json['stockOn'];
    isIssued = json['isIssued'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bookId'] = bookId;
    _data['title'] = title;
    _data['author'] = author;
    _data['publisher'] = publisher;
    _data['cost'] = cost;
    _data['categoryId'] = categoryId;
    _data['borrower'] = borrower;
    _data['issuer'] = issuer;
    _data['issueOn'] = issueOn;
    _data['returnOn'] = returnOn;
    _data['shouldReturnOn'] = shouldReturnOn;
    _data['fineAmount'] = fineAmount;
    _data['isActive'] = isActive;
    _data['stockKeeper'] = stockKeeper;
    _data['stockOn'] = stockOn;
    _data['isIssued'] = isIssued;
    return _data;
  }

  Book.fromResult(ResultRow r) {
    bookId = r['bookId'];
    title = r['title'];
    author = r['author'];
    publisher = r['publisher'];
    cost = r['cost'];
    categoryId = r['categoryId'];
    borrower = Student.fromResult(r);
    issuer = User.fromResult(r);
    issueOn = r['issueOn'];
    returnOn = r['returnOn'] ?? DateTime(DateTime.now().year - 1);
    shouldReturnOn = r['shouldReturnOn'];
    fineAmount = r['fineAmount'];
    isActive = r['isActive'];
    stockKeeper = User.fromResult(r);
    stockOn = r['stockOn'];
    isIssued = r['isIssued'];
  }

  @override
  List<Object?> get props => [
        bookId,
        title,
        author,
        publisher,
        cost,
        categoryId,
        borrower,
        issuer,
        issueOn,
        returnOn,
        shouldReturnOn,
        fineAmount,
        isActive,
        stockKeeper,
        stockOn,
        isIssued
      ];
}
